package policy

deny[msg] {
  input.resource_type == "aws_s3_bucket"
  input.acl == "public-read"
  msg = "S3 bucket has public read ACL, which is not allowed"
}
