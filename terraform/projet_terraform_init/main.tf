resource vsphere_role "role-terraform-michael" {
  name = "terraform_role-michael"
  role_privileges = ["Alarm.Acknowledge", "Alarm.Create", "Datacenter.Create", "Datacenter.Move"]
  
  provisioner "local-exec" {
    command = "ansible-playbook ../../playbooks/deploy_zabbix.yml"
  }
}

resource "vsphere_virtual_machine" "vm" {
  name = "terraform-michael"
  resource_pool_id  = data.vsphere_resource_pool.pool.id
  datastore_id      = data.vsphere_datastore.datastore.id
  num_cpus = var.cpu
  memory   = var.memory_mb
  guest_id = var.guest_id
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  disk {
    label = var.disk.label
    size  = var.disk.size
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
    command = "ansible-playbook ../../deploy_zabbix.yml"
  }
}