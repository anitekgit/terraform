variable "ami" {
  type = "list"
  default = ["ami-id-1","ami-id-2","ami-id-3","ami-id-3","ami-id-4","ami-id-5","ami-id-6","ami-id-7","ami-id-8"]
  }


variable "instance_count" {
  default = "8"
}

variable "instance_type" {
  type = "list"
  default = ["t2.medium","t2.medium","t2.large","t2.medium","t2.medium","t2.small","t2.large","t2.medium"]
}

variable "availability_zone"{
  default = "ap-south-1a"
}

variable "aws_key_pair" {
  type = "list"
  default = ["keypair-1","keypair-2","keypair-3","keypair-4","keypair-5","keypair-6","keypair-7","keypair-8"]


variable "tags" {
  type = "list"
  default = ["Instace-Name-1","Instace-Name-2","Instace-Name-3","Instace-Name-4","Instace-Name-5","Instace-Name-6","Instace-Name-7","Instace-Name-8"]
}

resource "aws_instance" "my-instance" {
  count         = "${var.instance_count}"
  ami           = "${element(var.ami,count.index)}"
  instance_type = "${element(var.instance_type,count.index)}"
  key_name      = "${element(var.aws_key_pair,count.index)}"
  availability_zone = "${var.availability_zone}"
  subnet_id = "${aws_subnet.account-subnet-private.id}"
  tags = {
     Name = "${element(var.tags,count.index)}"
   }
}
