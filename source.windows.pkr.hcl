source "proxmox-iso" "windows10" {

  # Connection Configuration
  proxmox_url             = "${var.proxmox_host}"
  username                = "${var.proxmox_api_user}"
  password                = "${var.proxmox_api_password}"
  insecure_skip_tls_verify    = "true"
  node                    = "${var.proxmox_node}"

  # Location Configuration
  vm_name                 = "Windows-10"
  #vm_id                   = "9005"
  template_description = "Windows 10 cloud-init template. Built on ${legacy_isotime("2006-01-02T15:04:05Z")}"

  # Hardware Configuration
  sockets                 = "1"
  cores                   = "4"
  cpu_type                = "kvm64"
  memory                   = "16384"
  scsi_controller      = "virtio-scsi-pci"

  disks {
    disk_size         = "60G"
    format            = "qcow2"
    storage_pool      = "storage0"
    storage_pool_type = "zfspool"
    type              = "sata"
  }

  # Boot Configuration
  boot_wait              = "10s"

  # Http directory Configuration
  http_directory           = "http"
  http_interface           = "Ethernet"

  # ISO Configuration
  iso_file                 = "local:iso/Windows1021H2.iso"
  #iso_url                 = "https://cdimage.debian.org/cdimage/release/10.9.0/amd64/iso-cd/debian-10.9.0-amd64-netinst.iso"
  #iso_storage_pool        = "iso-store"

  additional_iso_files {
    device   = "sata3"
    iso_file = "local:iso/Autounattend.iso"
    unmount  = true
  }

  additional_iso_files {
    device   = "sata4"
    iso_file = "local:iso/virtio-win-0.1.208.iso"
    unmount  = true
  }

  # VM Configuration
  os                      = "win10"
  vga {
      type                =  "std"
      memory              =  32
  }

  cloud_init              = true
  cloud_init_storage_pool = "storage0"
  communicator            = "winrm"


  network_adapters {
    bridge   = "vmbr0"
    firewall = true
    model    = "e1000"
  }

  unmount_iso          = true

  winrm_insecure       = true
  winrm_password       = "vagrant"
  winrm_port           = 5985
  winrm_timeout        = "60m"
  winrm_use_ssl        = false
  winrm_username       = "vagrant"
}
