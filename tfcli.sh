# file terraform.tfstate tidak boleh hilang tetapi sebaiknya juga jangan di disimpan di git tetapi bisa di GCS atau S3 (buat secara manual saja) best practicenya kita tulis konfigurasi pada backend.tf

# mengaktifkan command line gcloud di terminal VSCODE
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser

# boleh menjalankan init jika setiap kali ada perubahan di manifest
terraform init

# Untuk penulisan konfigurasi yang rapi
terraform fmt 

# pengecekan konfigurasi apakah sudah sesuai
terraform validates

# cek resource yang akan terbuat ketika di provider tujuan setelah di apply
terraform plan

# membuat atau update infrastructur di cloud
terraform apply

# apply tanpa melakukan konfirmasi karna sangat cocok di gunakan ketika melakukan proses CI/CD pipeline
terraform apply -auto-approve

# override value variable saat terraform plan atau apply
terraform plan -var allow_stop_vm=false

# refresh/update state pad terraform
terraform refresh

# melihat value asli output resource sebelum di apply
terraform output "ip_public_vm-1"

# melihat semua state
terraform state list

# melihat detail dari suatu state
terraform state show {state name}

# menghapus state
terraform state rm {state name}

# menghapus spesifik resource
terraform destroy -target <type>.<name>
terraform destroy -target google_compute_instance.vm-1

# menghapus semua resource
terraform destroy

# plan spesifik resource
terraform plan -target <type>.<name>
terraform plan -target google_compute_instance.vm-1

# apply spesifik resource
terraform apply -target <type>.<name>
terraform apply -target google_compute_instance.vm-1

# resource lifecycle #
# resource lifecycle digunakan untuk mengontrol behavior dari sebuah resource saat di buat, di update atau di hapus
# contohnya kita bisa mencegah suatu resource terhapus secara tidak sengaja saat menjalankan "terraform destroy"
# lifecycle bisa di definisikan di resource mana saja

# terraform import command #
# sebelum mengimplementasikan import command, di wajibkan dulu MENDEFINISIKAN block resource dengan blank content pada file terraform.tf nya
# resource "google_compute_instance" "vm-1" {
# }
# pastikan membaca dokumentasi dari resource yang ingin di import untuk melihat format importnya
terraform import <type>.<name> <ADDR ID> // import resource - status harus import successful!
terraform import google_compute_instance.default {{project}}/{{zone}}/{{name}}
terraform import google_compute_instance.vm-1 terraform-project/asia-southeast1/vm-1
# setelah import state & konfigurasi resource block, lakukan pengecekan dengan terraform plan dan sesuaikan.
terraform plan
terraform plan -target google_compute_instance.vm-1
# cek state
terraform state list
terraform state show {state name}
terraform state show google_compute_instance.vm-1 
#setelah melakukan import MINIMAL menuliskan REQUIRED FIELD dari resource tersebut.

# list public image
gcloud compute images list