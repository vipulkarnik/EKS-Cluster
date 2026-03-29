Run it with below 
1. terraform init -backend-config=us-east-1-backend.tfvars
2. terraform plan -out plan.out -var-file="regions/us-east-1.tf"
3. terrafom apply plan.out
