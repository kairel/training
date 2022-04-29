data "vsphere_datacenter" "dc" {
  name = "APPS" 
}

data "vsphere_datastore" "datastore" {
  name = "NFS"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name = "Cluster-Apps/Resources"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name = "Net"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name = "CENTOS-8.x"
  datacenter_id = data.vsphere_datacenter.dc.id
}
