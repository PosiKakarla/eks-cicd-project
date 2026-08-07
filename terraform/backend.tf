terraform{
    backend "s3" {
        bucket         = "posikakarla-eks-cicd-tfstate"
        key            = "eks-cicd/terraform.tfstate"
        region         = "ap-south-1"
        dynamodb_table = "eks-cicd-tfstate-lock"
        encrypt        = true
    }
}