variable "vpc_cidr" {
  type = string

}

variable "vpc_name" {
  type = string
}

variable "subnets" {
  type = list(object({
    cidr_block        = string
    availability_zone = string
    name              = string
  }))
}

