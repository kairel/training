data "vsphere_datacenter" "dc" {
  name = "Datacenter 1" 
}

data "vsphere_datastore" "datastore" {
  name = "data1"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name = "Martin"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name = "VM Network"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name = "Rhel 8"
  datacenter_id = data.vsphere_datacenter.dc.id
}
