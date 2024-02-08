variable "aws_access_key" {
  type    = string
  default = ""
}

variable "aws_secret_key" {
  type    = string
  default = ""
}

// ==== EC2 ====
variable "list_vm" {
  type    = list(string)
  default = ["vm1", "vm2"]
}

// ==== VPC ====
variable "vpc_id" {
  type    = string
  default = "vpc-06fdb07ebd8d81079" // ID VPC
}