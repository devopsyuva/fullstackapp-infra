{
    "Statement": [
        {
            "Action": [
                "ssm:DescribeParameters"
            ],
            "Effect": "Allow",
            "Resource": "*",
            "Sid": "TechSystemManagerDescParams"
        },
        {
            "Action": [
                "ssm:GetParameters",
                "ssm:GetParameter"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:ssm:ap-south-1:099730796456:parameter/visualpathtech*",
            "Sid": "TechSystemManagerGetParams"
        },
        {
            "Action": [
                "s3:GetObject",
                "s3:GetObjectVersion"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:s3:::visualpathbackups/visualpathtech/db/*",
            "Sid": "TechDBbackup"
        }
    ],
    "Version": "2012-10-17"
}