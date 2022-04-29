resource vsphere_role "role-terraform" {
  name = "terraform_role"
  role_privileges = ["Alarm.Acknowledge", "Alarm.Create", "Datacenter.Create", "Datacenter.Move"]
}

resource "vsphere_virtual_machine" "vm" {
  name = "terraform-michael"
  resource_pool_id  = data.vsphere_resource_pool.pool.id
  datastore_id      = data.vsphere_datastore.datastore.id
  num_cpus = 2
  memory   = 2048
  guest_id = "centos7_64Guest"
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  disk {
    label = "disk0"
    size  = 24
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = "terraform"
        domain    = "server.com"
      }
      network_interface {
        ipv4_address = "192.168.1.3"
        ipv4_netmask = "24"
      }
     ipv4_gateway = "192.168.1.254"
     dns_server_list = ["8.8.8.8"]
    }
  }
  provisioner "local-exec" {
    command = "ansible-playbook ../../deploy_lamp.yml"
  }
}