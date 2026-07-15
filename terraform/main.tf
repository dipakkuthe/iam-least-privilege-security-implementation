terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_iam_group" "readonly" {
  name = "${var.project_name}-readonly"
}

resource "aws_iam_policy" "s3_readonly" {
  name        = "${var.project_name}-s3-readonly"
  description = "Least privilege read-only access to one S3 bucket"
  policy      = file("${path.module}/../policies/s3-readonly-policy.json")
}

resource "aws_iam_group_policy_attachment" "readonly_s3" {
  group      = aws_iam_group.readonly.name
  policy_arn = aws_iam_policy.s3_readonly.arn
}

resource "aws_iam_role" "lambda_execution" {
  name = "${var.project_name}-lambda-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_basic" {
  role       = aws_iam_role.lambda_execution.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
