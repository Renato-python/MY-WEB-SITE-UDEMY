resource "aws_s3_bucket" "my-bucket-2026" {
  bucket =  var.bucket_name
  
}

resource "aws_s3_bucket_website_configuration" "my_bucket_config" {
  bucket = aws_s3_bucket.my-bucket-2026.id

  index_document {
    suffix = "index.html"
  }
}


resource "aws_s3_bucket_policy" "my_bucket_policy" {
  bucket = aws_s3_bucket.my-bucket-2026.id
policy = jsonencode({
  Version = "2012-10-17"
  Statement = [
    {
      Effect = "Allow"
      Principal = "*"
      Action = "s3:GetObject"
      resource = "${aws_s3_bucket.my-bucket-2026.arn}/*"
    }
  ]
})  
}

resource "aws_s3_bucket_public_access_block "my_bucket_access" {
  bucket                     = aws_s3_bucket.my-bucket-2026.id
  block_public_acls          = false 
  block_public_policy        = false 
  ignore_public_acls         = false 
  restrict_public_buckets    = false 
}

  
