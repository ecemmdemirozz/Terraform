variable "bucket_name" {
    default = "backend-terraform-state-ecem-2023"
    type = string
    description = "bucket name"

}
variable "env" {
    description = "enviroment"
    type = string
    default = ""
}