# resource "aws_launch_template" "launch" {
#   name_prefix   = "launch"
#   image_id      = "ami-0678ba748f8190675"
#   instance_type = "t2.micro"
# }

# resource "aws_autoscaling_group" "bar" {
#   availability_zones = ["us-east-1a"]
#   desired_capacity   = 2
#   max_size           = 4
#   min_size           = 1

#   launch_template {
#     id      = aws_launch_template.launch.id
#     version = "$Latest"
#   }
# }