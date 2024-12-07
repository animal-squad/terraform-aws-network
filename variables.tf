/*
  공통 사항
*/

variable "name_prefix" {
  description = "VPC 구성 요소들의 이름과 tag를 선언하는데 사용될 prefix."
  type        = string

  validation {
    condition     = length(var.name_prefix) <= 50
    error_message = "이름에 사용될 prefix는 50자를 넘을 수 없습니다."
  }
}

/*
  VPC 자원
*/

variable "vpc_cidr_block" {
  description = "VPC에 할당 할 CIDR 블럭"
  type        = string
}

variable "enable_dns_hostnames" {
  description = "VPC내 public ip를 가지는 인스턴스에 public dns 제공 여부"
  type        = bool
}

variable "public_subnet" {
  description = "생성할 public subnet. key는 subnet 이름에 postfix로 사용됩니다."
  type = map(object({
    az          = string
    cidr_block = string
  }))
  default = {}
}

variable "private_subnet" {
  description = "생성할 private subnet. key는 subnet 이름에 postfix로 사용됩니다."
  type = map(object({
    az          = string
    cidr_block = string
  }))
  default = {}
}
