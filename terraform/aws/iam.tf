
resource "aws_iam_role"  "ec2_cloudwatch_role"{
   
    name               = "ec2-cloudtwatch-role"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF    
}

resource "aws_iam_policy"   "ec2_cldwatch_policy" {
    name = "ec2-cloudtwatch-policy"
    description = "ec2-cloudtwatch-policy"

    policy = jsonencode ({
   
        "Version": "2012-10-17",
        "Statement": [
            {
              
                "Effect": "Allow",
                "Action": [
                    "events:*",
                    "s3:*"
                ]    
                "Resource": "*"
            }
        ]  
    })    
}

resource "aws_iam_role_policy_attachment" "ec2_cldwatch_attachment" {
  role = aws_iam_role.ec2_cloudwatch_role.id
  policy_arn = aws_iam_policy.ec2_cldwatch_policy.arn
}
