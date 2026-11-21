output "bucket_name" {
  description = "Name of the website bucket."
  value       = aws_s3_bucket.website.id
}

output "website_url" {
  description = "Public HTTP URL of the S3 website."
  value       = "http://${aws_s3_bucket_website_configuration.website.website_endpoint}"
}