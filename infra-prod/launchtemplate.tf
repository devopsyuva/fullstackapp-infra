resource "aws_launch_template" "app_launchtemplate" {
  name = var.app_template_name

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size           = 40
      volume_type           = "gp2"
      delete_on_termination = true
    }
  }

  image_id = data.aws_ami.ubuntu_ami.id

  instance_type = var.app_launch_type

  monitoring {
    enabled = true
  }

  placement {
    tenancy = "default"
  }

  vpc_security_group_ids = [aws_security_group.app_sg.id]
  
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "VPTedu-app"
    }
  }

  key_name = var.app_keypair

  user_data = filebase64("scripts/ec2_initialization.sh")

  iam_instance_profile {
    name = aws_iam_instance_profile.app_profile.name
  }

  tags = merge(
    local.common_tags,
    {
      Name = "VPTEdu-APP-LT"
    }
  )

}