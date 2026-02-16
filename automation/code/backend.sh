#Create bucket for terraform state
aws s3 mb s3://terraform-state-lumbini --region us-east-1

#Enable versioning for the bucket
aws s3api put-bucket-versioning --bucket terraform-state-lumbini --versioning-configuration Status=Enabled

#Enable server-side encryption for the bucket

aws s3api put-bucket-encryption \
 --bucket terraform-state-lumbini \
 --server-side-encryption-configuration '{
    "Rules":[{
    "ApplyServerSideEncryptionByDefault":{
        "SSEAlgorithm":"AES256"
    }
    }]
}'