terraform {
  backend "s3" {
    bucket = "spring-helloapp"
    key    = "terraform/dev/helloapp"
    region = "us-east-2"
    profile = "bishwa"
  }
}