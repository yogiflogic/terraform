# karena konfigurasi backend berda fdalam block terraform blocks, kita harus menjalankan perintah terraform init lagi 
# ekspetasinya file penting "terraform.tfstate" akan di simpan secara otomatis ke gcs bucket dan akan di maintanance oleh terraform
terraform {
  backend "gcs" {
    bucket = "nama-bucket-yogi"
  }
}