# Output the cluster name, ID and kube_config

output "cluster_name" {
  description = "Cluster Name"
  value       = rancher2_cluster_v2.cluster.name
}

output "cluster_id" {
  description = "Cluster ID"
  value       = rancher2_cluster_v2.cluster.id
}

output "cluster_kube_config" {
  description = "Kube Config"
  value       = rancher2_cluster_v2.cluster.kube_config
  sensitive   = true
}

output "cluster_rke_config" {
  description = "Cluster rke_config"
  value       = rancher2_cluster_v2.cluster.rke_config
  sensitive   = false
}
