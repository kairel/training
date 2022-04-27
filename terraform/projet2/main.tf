// fetch the latest ubuntu release image from their mirrors
resource "libvirt_volume" "base" {
  name   = "ubuntu"
  source = "https://cloud-images.ubuntu.com/minimal/daily/impish/20220322/impish-minimal-cloudimg-amd64.img"
  format = "qcow2"
}
resource "libvirt_domain" "dommain-ubuntu" {
  name   = "ubuntu"
  memory = "1024"
  vcpu   = 1

  kernel = libvirt_volume.base.id

}
