S3 Bucket that needs to be created in the region of the EKS created, if ran with pre-set backend details(Adjust them accordingly to vars set in regions/*)
us-east-1-prod-eks1-bucket
ap-south-1-prod-eks1-bucket

Run it with below 
1. terraform init -backend-config=us-east-1-backend.tfvars
2. terraform plan -out plan.out -var-file="regions/us-east-1.tf"
3. terrafom apply plan.out
