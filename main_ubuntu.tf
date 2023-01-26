provider "aws" {
        access_key = "====================="
        secret_key = "====================="
        region = "ap-south-1"
}
resource "aws_instance" "dev_Ins" {
        ami = "ami-06984ea821ac0a879"
        instance_type = "t2.micro"
        key_name = "KeyPairJan2022"
        subnet_id = "subnet-06e3260c3cdca46d6"
        vpc_security_group_ids = ["sg-0d23fef751c6f316a"]
	user_data = "${file("mydata.sh")}"
        tags = {
                Name = "Dev_Inst"
	}
}

output "dev_Ins_ip" { value = aws_instance.dev_Ins.public_ip }
