data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["bitnami-tomcat-*-x86_64-hvm-ebs-nami"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["979382823631"] # Bitnami
}

# resource - keyword to tell terraform that we're defining a resource
# aws_instance - resource type (types are defined by specific provider and correlate to infrastructure elements)
# blog - resource name
resource "aws_instance" "blog" {
  ami           = data.aws_ami.app_ami.id # defines the base image to use to create server
  instance_type = var.instance_type

  tags = {
    Name = "HelloWorld"
  }
}
