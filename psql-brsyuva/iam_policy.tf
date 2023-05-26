resource "aws_iam_policy" "psql_policy" {
  name = var.psql_policy_name
  path = "/"
  description = "PSQL policy for Secert Manager and S3 read-only access"

  policy = jsonencode({
    Statement: [
        {
            "Action": [
                "ssm:DescribeParameters"
            ],
            "Effect": "Allow",
            "Resource": "*",
            "Sid": "BRSyuvaSystemManagerDescParams"
        },
        {
            "Action": [
                "ssm:GetParameters",
                "ssm:GetParameter"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:ssm:ap-south-1:099730796456:parameter/brsyuva*",
            "Sid": "BRSyuvaSystemManagerGetParams"
        },
        {
            "Sid": "AllowListBuckets",
            "Action": [
                "s3:ListAllMyBuckets",
                "s3:GetBucketLocation"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:s3:::*"
            ]
        },
        {
            "Sid": "AllowBRSyuvaDBFolderAccess",
            "Action": [
                "s3:ListBucket"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:s3:::visualpathbackups"
            ],
            "Condition": {
                "StringEquals": {
                    "s3:prefix": [
                        "",
                        "brsyuva/",
                        "brsyuva/db"
                    ],
                    "s3:delimiter": [
                        "/"
                    ]
                }
            }
        },
        ,
        {
            "Action": [
                "s3:ListBucket"
            ],
            "Condition": {
                "StringLike": {
                    "s3:prefix": [
                        "brsyuva/db/*"
                    ]
                }
            },
            "Effect": "Allow",
            "Resource": [
                "arn:aws:s3:::visualpathbackups"
            ],
            "Sid": "AllowBRSyuvaDBAccess"
        },
        {
            "Action": [
                "s3:GetObject",
                "s3:GetObjectVersion",
                "s3:PutObject",
                "s3:DeleteObject"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:s3:::visualpathbackups/brsyuva/db/*",
            "Sid": "BRSyuvaUploadBackups"
        }
    ],
    Version: "2012-10-17"
  })
}