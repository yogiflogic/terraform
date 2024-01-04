# Input variable validation #

# error karena ada spasi
terraform plan -var container_name="mantap bro"

# error karena prefixnya bukan "nginx-"
terraform plan -var container_name="mantapbro"

# berhasil
terraform plan -var container_name="nginx-mantapbro"  