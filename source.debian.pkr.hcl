source "proxmox-iso" "debian" {
  # Connection Configuration
  proxmox_url              = "${var.proxmox_host}"
  username                 = "${var.proxmox_api_user}"
  password                 = "${var.proxmox_api_password}"
  insecure_skip_tls_verify = "true"
  node                     = "${var.proxmox_node}"

  # Cloud init enable
  cloud_init              = "true"
  cloud_init_storage_pool = "storage0"

  # Location Configuration
  vm_name = "debian-11.4.0-amd64"
  vm_id   = "9005"

  # Hardware Configuration
  sockets  = "4"
  cores    = "1"
  memory   = "8192"
  cpu_type = "kvm64"

  # Boot Configuration
  boot_command = ["<esc><wait>auto url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg<enter>"]
  boot_wait    = "5s"

  # Http directory Configuration
  http_directory = "http"
  http_interface = "Ethernet"


  # ISO Configuration
  iso_file = "local:iso/debian-11.4.0-amd64-netinst.iso"
  #iso_url                 = "https://cdimage.debian.org/cdimage/release/10.9.0/amd64/iso-cd/debian-10.9.0-amd64-netinst.iso"
  #iso_storage_pool        = "iso-store"

  # VM Configuration
  os = "l26"
  vga {
    type   = "std"
    memory = 32
  }

  network_adapters {
    model  = "virtio"
    bridge = "vmbr0"
  }

  disks {
    storage_pool      = "local-lvm"
    storage_pool_type = "lvm-thin"
    type              = "scsi"
    disk_size         = "10"
    cache_mode        = "none"
    format            = "raw"
  }

  template_name        = "debian-11.4.0-amd64"
  template_description = ""
  unmount_iso          = "true"
  qemu_agent           = "true"

  # Communicator Configuration
  communicator           = "ssh"
  ssh_username           = "root"
  ssh_password           = "packer"
  ssh_handshake_attempts = "20"
  ssh_timeout            = "1h30m"

}
