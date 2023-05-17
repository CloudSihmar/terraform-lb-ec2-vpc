variable "vpc-cidr" {
default = "10.10.0.0/16"
}

variable "public-cidr" {
type = list
default = ["10.10.1.0/24","10.10.4.0/24"]
}

variable "az" {
type = list
default = ["us-east-2a", "us-east-2b"]
}
variable "private-cidr" {
default = "10.10.2.0/24"
}



