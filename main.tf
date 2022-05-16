resource "aws_s3_bucket" "s3bucket" {
  bucket = var.bucketname
  acl = "public-read"
  policy = file("${path.module}/policy.json")
  website {
    index_document = "index.html"
    error_document = "error.html"

  }
  }

resource "aws_s3_bucket_object" "s3bucketobject1" {
  bucket = aws_s3_bucket.s3bucket.id
  key = "index.html"
  source = "${path.module}/html/index.html"
  content_type = "text/html"

}

resource "aws_s3_bucket_object" "s3bucketobject2" {
  bucket = aws_s3_bucket.s3bucket.id
  key = "error.html"
  source = "${path.module}/html/error.html"
  content_type = "text/html"

}
