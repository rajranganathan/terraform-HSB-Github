resource "aws_instance" "bast-instance" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  key_name             = "${aws_key_pair.mykeypair.key_name}"
  vpc_security_group_ids = ["${aws_security_group.bastion-sg.id}"]
  subnet_id = "${aws_subnet.main-public-1.id}"
  lifecycle              { create_before_destroy = true }
  
  tags {
    Name = "Bastion Instance"
  }
}

