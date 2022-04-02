build {
  sources = ["source.proxmox-iso.debian" ]

  provisioner "file" {
    destination = "/etc/cloud/cloud.cfg"
    source      = "cloud.cfg"
  }

  provisioner "shell" {
    inline = ["echo 'Packer Template Build -- Complete'"]
  }
}
