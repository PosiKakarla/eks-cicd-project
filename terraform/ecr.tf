resource "aws_ecr_repository" "app" {
  name                 = "eks-cicd-python-app"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Project = "eks-cicd-portfolio"
  }
}