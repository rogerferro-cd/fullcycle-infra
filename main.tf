module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type          = "t3.micro"
  monitoring             = false
  vpc_security_group_ids = ["sg-0664cac88daa6a26b"]
  subnet_id              = "subnet-042560e37bc8225a7"

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name        = "Teste pipeline v1"
  }
}

terraform {
  backend "s3" {
    bucket = "bkt-rogerferro "
    key    = "minha-chave-aws"
    region = "us-east-1"
  }
}