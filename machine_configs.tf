# Create vsphere machine config v2
resource "rancher2_machine_config_v2" "cp_config" {
  generate_name = "cp"
  vsphere_config {
    clone_from    = var.vsphere_template
    creation_type = "template"
    cpu_count     = var.control_plane_cpu
    memory_size   = var.control_plane_memory
    disk_size     = var.control_plane_disk_size
    datacenter    = var.vsphere_datacenter
    datastore     = var.vsphere_datastore
    folder        = var.vsphere_folder
    network       = var.vsphere_network
    pool          = var.vsphere_resource_pool
    tags          = var.vsphere_tags
    cfgparam      = var.vsphere_cfgparam
    cloud_config = templatefile("${abspath(path.module)}/templates/cloud-init.tftmpl", {
      salt_password = var.salt_password
      ssh_key       = var.ssh_key
    })
  }
}

# Create worker machine config v2
resource "rancher2_machine_config_v2" "worker_config" {
  generate_name = "worker"
  vsphere_config {
    clone_from    = var.vsphere_template
    creation_type = "template"
    cpu_count     = var.worker_cpu
    memory_size   = var.worker_memory
    disk_size     = var.worker_disk_size
    datacenter    = var.vsphere_datacenter
    datastore     = var.vsphere_datastore
    folder        = var.vsphere_folder
    network       = var.vsphere_network
    pool          = var.vsphere_resource_pool
    tags          = var.vsphere_tags
    cfgparam      = var.vsphere_cfgparam
    cloud_config = templatefile("${abspath(path.module)}/templates/cloud-init.tftmpl", {
      salt_password = var.salt_password
      ssh_key       = var.ssh_key
    })
  }
}
