provider "vsphere" {
  user           = "terraform@vsphere.local"
  password       = "Terraform1234!"
  vsphere_server = "172.18.100.252"

  # If you have a self-signed cert
  allow_unverified_ssl = true
}
