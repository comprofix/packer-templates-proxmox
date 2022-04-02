packer {
  required_plugins {
    windows-update = {
      version = "0.14.0"
      source = "github.com/rgl/windows-update"
    }
  }
}

build {
  sources = ["source.proxmox-iso.windows10"]

  provisioner "windows-update" {
    filters         = ["exclude:$_.Title -like 'Preview'", "include:$true"]
    search_criteria = "IsInstalled=0"
    update_limit    = 25
  }

  provisioner "windows-shell" {
    scripts = ["scripts/sysprep.bat"]
  }

}
