#create s3 bucket
resource "aws_s3_bucket" "bucket0p" {
  bucket = var.bucketname
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.bucket0p.id

 
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.bucket0p.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "buckets3" {
  depends_on = [
    aws_s3_bucket_ownership_controls.buckets3,
    aws_s3_bucket_public_access_block.buckets3,
  ]

  bucket = aws_s3_bucket.bucket0p.id

}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.bucket0p.id


}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.bucket0p.id
  
}

resource "aws_s3_object" "profile" {
  bucket = aws_s3_bucket.bucket0p.id

}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.bucket0p.id
  
  depends_on = [ aws_s3_bucket_acl.buckets3 ]
}
