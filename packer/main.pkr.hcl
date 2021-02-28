source "linode" "community_gateway" {
  linode_token      = var.linode_token
  ssh_username      = var.ssh_username
  image             = var.community_gateway_image
  region            = var.community_gateway_region
  instance_type     = var.community_gateway_instance_type
  instance_label    = var.community_gateway_instance_label
  instance_tags     = var.community_gateway_instance_tags
  swap_size         = var.community_gateway_swap_size
  image_label       = var.community_gateway_image_label
  image_description = var.community_gateway_image_description
}

build {
  name = "community_gateway"

  sources = [
    "source.linode.community_gateway"
  ]

  provisioner "shell" {
    inline = [
      "pacman -Syu --noconfirm",
      "pacman -S ansible --noconfirm"
    ]
  }

  provisioner "file"{
    sources     = ["variables/ansible.json", "ansible/totp.yml"]
    destination = "/tmp/"
  }

  provisioner "ansible-local" {
    playbook_file   = "./ansible/user.yml"
  }
}
