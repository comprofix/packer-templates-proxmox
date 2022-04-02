build {
  sources = ["source.proxmox-iso.debian" ]

  provisioner "file" {
    destination = "/etc/cloud/cloud.cfg"
    source      = "cloud-init/cloud.cfg"
  }

  provisioner "shell" {
    inline = ["echo 'Packer Template Build -- Complete'"]
  }
}
