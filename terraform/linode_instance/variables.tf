variable "tags" {
  type = list(string)
}

variable "region" {
  type = string
}

variable "linode_instance_community_gateway_group" {
  type = string
}

variable "linode_instance_community_gateway_label" {
  type = string
}

variable "linode_instance_community_gateway_image" {
  type = string
}

variable "linode_instance_community_gateway_type" {
  type = string
}

variable "linode_instance_community_gateway_swap_size" {
  type = string
}

variable "linode_instance_community_gateway_private_ip" {
  type = bool
}
