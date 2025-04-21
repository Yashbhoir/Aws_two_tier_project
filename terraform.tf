terraform {
        required_providers {
                aws = {
                    source = "hashicorp/aws"
                }
        }
}

provider aws {
        region = "us-east-1"
        #access_key = {aws_access_key}
        #secret_key = {aws_secret_key}
}
