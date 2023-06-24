variable "instance_type" {

  default     = "t2.micro"
  description = "instance type for web server"
  type        = string

}
variable "key_name" {
  description = "this is my key name"
  default     = "ecem@mac"
  type        = string


}
variable "ssh_from_port" {
  description = "this is my key name"
  default     = 22
  type        = number


}
variable "ssh_to_port" {
  description = "this is my key"
  default     = 22
  type        = number

}
variable "protocol" {
  description = "this is tcp protocol"
  default     = "tcp"
  type        = string

}
variable "protocol_egress" {
  description = "this is tcp protocol"
  default     = "tcp"
  type        = string





}
variable "env" {
  type        = string
  default     = "prod"
  description = "prod enviroment"
}


