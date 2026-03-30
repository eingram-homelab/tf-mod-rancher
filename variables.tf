# Rancher connection variables
variable "rancher_api_url" {
  type        = string
  description = "The URL for the Rancher API"
}

variable "rancher_access_key" {
  type        = string
  description = "The access key for Rancher API"
}

variable "rancher_secret_key" {
  type        = string
  description = "The secret key for Rancher API"
  sensitive   = true
}

variable "rancher_insecure" {
  type        = bool
  description = "Whether to skip TLS verification"
  default     = false
}

# Cluster configuration variables
variable "cluster_name" {
  type        = string
  description = "Name of the cluster to be created"
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version to use for the cluster"
}

variable "vsphere_cloud_credential_name" {
  type        = string
  description = "Name of the vSphere cloud credential secret in Rancher"
}

variable "vsphere_tags" {
  type        = list(string)
  description = "List of tags to apply to the VMs"
}

# Node configuration variables
variable "control_plane_node_count" {
  type        = number
  description = "Number of control plane nodes"
  # default     = 3
}

variable "worker_node_count" {
  type        = number
  description = "Number of worker nodes"
  # default     = 3
}

variable "control_plane_cpu" {
  type        = number
  description = "Number of CPUs for control plane nodes"
  # default     = 2
}

variable "control_plane_memory" {
  type        = number
  description = "Memory in MB for control plane nodes"
  # default     = 4096
}

variable "control_plane_disk_size" {
  type        = number
  description = "Disk size in MB for control plane nodes"
  # default     = 61240
}

variable "worker_cpu" {
  type        = number
  description = "Number of CPUs for worker nodes"
  # default     = 2
}

variable "worker_memory" {
  type        = number
  description = "Memory in MB for worker nodes"
  # default     = 4096
}

variable "worker_disk_size" {
  type        = number
  description = "Disk size in MB for worker nodes"
  # default     = 61240
}

# vSphere configuration variables
variable "vsphere_datacenter" {
  type        = string
  description = "vSphere datacenter name"
}

variable "vsphere_datastore" {
  type        = string
  description = "vSphere datastore name"
}

variable "vsphere_folder" {
  type        = string
  description = "vSphere folder path"
}

variable "vsphere_network" {
  type        = list(string)
  description = "vSphere network name"
}

variable "vsphere_resource_pool" {
  type        = string
  description = "vSphere resource pool name"
}

variable "vsphere_template" {
  type        = string
  description = "vSphere template name to clone from"
}

variable "vsphere_username" {
  type        = string
  description = "vSphere username"
}

variable "vsphere_password" {
  type        = string
  description = "vSphere password"
  sensitive   = true
}

variable "vsphere_vcenter" {
  type        = string
  description = "vSphere vCenter name"
}

variable "cluster_cni" {
  type        = string
  description = "CNI plugin to use for the cluster"
  default     = "calico"
}

variable "disabled_features" {
  type        = list(string)
  description = "List of disabled features"
}

variable "vsphere_cfgparam" {
  type        = list(string)
  description = "vSphere configuration parameters"
  default     = []
}

variable "salt_password" {
  type        = string
  description = "Salt password for the nodes"
  sensitive   = true
}

variable "ssh_key" {
  type        = string
  description = "SSH public key for the nodes"
}

variable "tls_san" {
  type        = list(string)
  description = "List of SANs for the TLS certificate"
  default     = []
}

variable "serialize_image_pulls" {
  type        = bool
  description = "Whether to serialize image pulls"
  default     = false
}

variable "kubelet_arg" {
  type        = list(string)
  description = "List of kubelet arguments"
  default     = []
}

variable "kube_apiserver_arg" {
  type        = list(string)
  description = "List of kube-apiserver arguments"
  default     = []
}

variable "etcd_arg" {
  type        = list(string)
  description = "List of etcd arguments"
  default     = []
}