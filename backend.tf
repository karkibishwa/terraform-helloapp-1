terraform {
  backend "s3" {
    bucket = "spring-helloapp"
    key    = "terraform/dev/helloapp"
    region = "us-east-1"
    profile = "bishwa"
  }
}