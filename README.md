Run it with below 
terraform init -backend-config=us-east-1-backend.tfvars
terraform plan -out plan.out -var-file="regions/us-east-1.tf"
terrafom apply plan.out
