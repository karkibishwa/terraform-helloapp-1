resource "aws_launch_configuration" "default" {
  name          = "terraform-sprinboot-helloapp-1"
  image_id      = "ami-098616968d61e549e"
  instance_type = "t2.micro"
  key_name = "docker"
  security_groups = ["${aws_security_group.default.id}"]
  iam_instance_profile = "${aws_iam_instance_profile.default.name}"
  user_data = "${data.template_file.default.rendered}"
  
  lifecycle {
    create_before_destroy = true
  }
}

data "template_file" "default" {
  template = "${file("script/user-data.sh")}"
  
  
}

