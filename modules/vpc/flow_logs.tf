resource "aws_s3_bucket" "logs" {
  bucket = "${var.name}-flowlogs"
}

resource "aws_flow_log" "this" {
  vpc_id       = aws_vpc.this.id
  traffic_type = "ALL"
  log_destination = aws_s3_bucket.logs.arn
}