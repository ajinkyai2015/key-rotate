import boto3
import os
import json
from datetime import datetime, timezone, timedelta
from botocore.exceptions import ClientError

# Creating a new Access Key and storing it in Secrets Manager
def create_new_key(iam, user_name):
    try:
        new_key = iam.create_access_key(UserName=user_name)['AccessKey']
        print(f"New access key is created for user {user_name}: {new_key['AccessKeyId']}")

        # Prepare the secret name and the secret value
        secret_name = f"{user_name}_access_keys"
        secret_value = {
            'AccessKeyId': new_key['AccessKeyId'],
            'SecretAccessKey': new_key['SecretAccessKey']
        }
        
        # Store the new key in AWS Secrets Manager
        secrets_manager.create_secret(
            Name=secret_name,
            Description=f"Access keys for {user_name}",
            SecretString=json.dumps(secret_value)
        )
        print(f"Stored new keys in Secrets Manager under the name {secret_name}")
        
        return new_key['AccessKeyId'], new_key['SecretAccessKey']
    except ClientError as e:
        print(f"Error creating/storing new key for {user_name}: {e}")
        raise

# Deactivating the old Access Key
def deactivate_key(iam, user_name, key_id):
    iam.update_access_key(UserName=user_name, AccessKeyId=key_id, Status='Inactive')
    print(f"Deactivated access key {key_id} for user {user_name}")

# Deleting the Old Access Key
def delete_key(iam, user_name, key_id):
    iam.delete_access_key(UserName=user_name, AccessKeyId=key_id)
    print(f"Deleted access key {key_id} for user {user_name}")

def lambda_handler(event, context):
    # Initializing the IAM and SNS client
    iam = boto3.client('iam')
    sns = boto3.client('sns')
    global secrets_manager
    secrets_manager = boto3.client('secretsmanager')

    topic_arn = os.environ['SNS_TOPIC_ARN']

    try:
        # Getting a list of all IAM users
        response = iam.list_users()
    except ClientError as e:
        print(f"Failed to list IAM users: {e}")
        return {
            "statusCode": 500,
            "body": "Failed to list IAM users"
        }

    # For each IAM user, rotate keys immediately for testing
    for user in response['Users']:
        user_name = user['UserName']
        try:
            access_keys = iam.list_access_keys(UserName=user_name)['AccessKeyMetadata']
        except ClientError as e:
            print(f"Failed to list access key for user {user_name}: {e}")
            continue

        for access_key in access_keys:
            key_id = access_key['AccessKeyId']
            status = access_key['Status']
            #create_date = access_key['CreateDate']
            #age = (datetime.now(timezone.utc) - create_date).days
            #last_used_response = iam.get_access_key_last_used(AccessKeyId=key_id)
            #last_used = last_used_response['AccessKeyLastUsed'].get('LastUsedDate', datetime.now(timezone.utc))

            try:
                # Create new key
                new_key_id, new_secret = create_new_key(iam, user_name)
                sns.publish(
                    TopicArn=topic_arn,
                    Message=f"A new access key has been created for user {user_name}: New Access Key Id={new_key_id} Please update the application and tool with a new access key. The old key will be inactive soon.",
                    Subject="New Access Key Created"
                )

                # Deactivate old key immediately for testing
                if status == 'Active':
                    deactivate_key(iam, user_name, key_id)
                    sns.publish(
                        TopicArn=topic_arn,
                        Message=f"The access key {key_id} has been deactivated for user {user_name}.",
                        Subject="Access Key Inactive"
                    )

                # Delete old key immediately for testing
                if status == 'Inactive':
                    delete_key(iam, user_name, key_id)
                    sns.publish(
                        TopicArn=topic_arn,
                        Message=f"The access key {key_id} has been deleted for user {user_name}.",
                        Subject="Access Key Deleted"
                    )

            except ClientError as e:
                print(f"Failed to rotate access key for user {user_name}: {e}")
                continue

    return {
        "statusCode": 200,
        "body": "Key Rotation is Successfully Completed!!"
    }
