resource "aws_iam_policy" "psql_policy" {
  name = var.psql_policy_name
  path = "/"
  description = "PSQL policy for Secert Manager and S3 read-only access"

  policy = jsonencode({
    Version: "2012-10-17",
    Statement: [
        {
            "Sid": "TechSystemManagerDescParams",
            "Effect": "Allow",
            "Action": [
                "ssm:DescribeParameters"
            ],
            "Resource": "*"
        },
        {
            "Sid": "TechSystemManagerGetParams",
            "Effect": "Allow",
            "Action": [
                "ssm:GetParameters",
                "ssm:GetParameter"
            ],
            "Resource": "arn:aws:ssm:ap-south-1:099730796456:parameter/visualpathtech*"
        },
		{
            "Sid": "TechDBbackup",
			"Effect": "Allow",
            "Action":[
                "s3:GetObject",
                "s3:GetObjectVersion"
            ],
            "Resource":"arn:aws:s3:::visualpathbackups/visualpathtech/db/*"
        }
    ]
  })
}