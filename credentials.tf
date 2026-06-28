resource "rancher2_cloud_credential" "vsphere" {
  name = var.vsphere_cloud_credential_name
  vsphere_credential_config {
    password = var.vsphere_password
    username = var.vsphere_username
    vcenter  = var.vsphere_vcenter
  }
}
