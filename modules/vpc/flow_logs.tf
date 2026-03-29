resource "random_id" "bucket_suffix" {
  byte_length = 6 
}

resource "aws_s3_bucket" "logs" {
  bucket = lower("${var.name}-${var.project}-${var.environment}-flowlogs-${random_id.bucket_suffix.hex}")
}

resource "aws_flow_log" "this" {
  vpc_id       = aws_vpc.this.id
  traffic_type = "ALL"
  log_destination = aws_s3_bucket.logs.arn
  log_destination_type = "s3"
}


resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.logs.id

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls  = true
  restrict_public_buckets = true
}
