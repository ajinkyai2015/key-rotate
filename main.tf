provider "aws" {
  region = var.region
}
terraform {
  backend "s3" {
    bucket         = "kr-statefile"
    key            = "kr-statefile/backend-sf/terraform.tfstate"
    region         = "us-west-2"
    #dynamodb_table = "your-dynamodb-table"  # Optional, for state locking
    encrypt        = true
  }
}

module "iam" {
  source = "./modules/iam"
}

module "sns" {
  source                 = "./modules/sns"
  sns_subscription_email = var.sns_subscription_email
}

module "lambda" {
  source = "./modules/lambda"
  sns_topic_arn       = module.sns.sns_topic_arn
  lambda_role_arn     = module.iam.lambda_iam_role_arn
  env1_create_key     = var.env1_create_key
  env2_disable_key    = var.env2_disable_key
  env3_delete_key     = var.env3_delete_key
  last_used_threshold = var.last_used_threshold
}

module "eventbridge" {
  source              = "./modules/eventbridge"
  lambda_function_arn = module.lambda.lambda_function_arn
}

module "ec2" {
  source          = "./modules/ec2"
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key_name
  instance_name   = var.instance_name
}
