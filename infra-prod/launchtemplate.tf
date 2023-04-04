resource "aws_launch_template" "visualtech_launchtemplate" {
  name = var.template_name

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size           = 50
      volume_type           = "gp2"
      delete_on_termination = false
    }
  }

  #ebs_optimized = true

  image_id = data.aws_ami.ubuntu_ami.id

  instance_type = var.visualtech_launch_type

  monitoring {
    enabled = true
  }

  placement {
    tenancy = "default"
  }

  vpc_security_group_ids = [aws_security_group.rjs_app_sg.id]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "VisualpathTech"
    }
  }

  key_name = var.app_keypair

  user_data = file("scripts/ec2_initialization.sh") #base64encode("scripts/ec2_initialization.sh")

  iam_instance_profile {
    arn = aws_iam_instance_profile.tech_profile.arn
  }

  tags = merge(
    local.common_tags,
    {
      Name = "VisualpathTech-LT"
    }
  )

}