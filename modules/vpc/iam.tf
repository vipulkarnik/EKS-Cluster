resource "aws_iam_role" "flow_logs" {
  name = "${var.name}-flowlogs-role"

  assume_role_policy = jsonencode({
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "vpc-flow-logs.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_s3_bucket_policy" "flow_logs" {
  bucket = aws_s3_bucket.logs.id

  policy = jsonencode({
    Statement = [
      {
        Sid    = "AWSLogDeliveryWrite"
        Effect = "Allow"
        Principal = {
          Service = "delivery.logs.amazonaws.com"
        }
        Action = "s3:PutObject"
        Resource = "${aws_s3_bucket.logs.arn}/*"
        Condition = {
          StringEquals = {
            "s3:x-amz-acl" = "bucket-owner-full-control"
          }
        }
      },
      {
        Sid    = "AWSLogDeliveryAclCheck"
        Effect = "Allow"
        Principal = {
          Service = "delivery.logs.amazonaws.com"
        }
        Action = "s3:GetBucketAcl"
        Resource = aws_s3_bucket.logs.arn
      }
    ]
  })
}
