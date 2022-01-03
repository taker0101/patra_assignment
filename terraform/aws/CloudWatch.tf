
resource "aws_cloudwatch_log_group" "patra_cldwatch_log" {
  name              = "patra-log-group"
  retention_in_days = 30
}

resource "aws_cloudwatch_log_stream" "patra_cldwatch_stream" {
  name           = "patra-log-stream"
  log_group_name = aws_cloudwatch_log_group.patra_cldwatch_log.name
}
