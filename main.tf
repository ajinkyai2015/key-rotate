provider "aws" {
  region = var.region
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
