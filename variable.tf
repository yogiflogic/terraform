# variable string
# variable "compute_zone" {
#   type    = string
#   default = "asia-southeast1-a"
# }

# variable list
# variable "compute_zone" {
#   type    = list
#   default = [
#     "asia-southeast1-a",
#     "asia-southeast1-b",
#     "asia-southeast1-c"
#   ]
# }

# variable map
variable "compute_zone" {
  type = map(any)
  default = {
    "zone-1" = "asia-southeast1-a",
    "zone-2" = "asia-southeast1-b",
    "zone-3" = "asia-southeast1-c"
  }
}

# variable boolean
variable "allow_stop_vm" {
  type    = bool
  default = true
}