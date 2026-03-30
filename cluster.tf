# Create a new rancher v2 RKE2 Custom Cluster
resource "rancher2_cluster_v2" "cluster" {
  name                  = var.cluster_name
  kubernetes_version    = var.kubernetes_version
  enable_network_policy = false

  # RKE2/K3s cluster config
  rke_config {
    machine_global_config = yamlencode({
      "disable" = length(var.disabled_features) > 0 ? var.disabled_features : []
      # cni = var.cluster_cni
      tls_san                           = var.tls_san
      selinux                           = true
      serialize_image_pulls             = var.serialize_image_pulls
      enable-controller-manager-metrics = true
      etcd-expose-metrics               = true
      kube-controller-manager-arg : ["bind-address=0.0.0.0", "terminated-pod-gc-threshold=10"]
      kube-proxy-arg : ["metrics-bind-address=0.0.0.0"]
      kube-scheduler-arg : ["bind-address=0.0.0.0"]
      kubelet-arg : var.kubelet_arg
      kube-apiserver-arg : var.kube_apiserver_arg
      etcd-arg : var.etcd_arg
    })

    # registries {
    #   system_default_registry = "docker.io"
    # }

    dynamic "machine_pools" {
      for_each = var.control_plane_node_count > 0 ? [1] : []
      content {
        name                         = "cp"
        cloud_credential_secret_name = rancher2_cloud_credential.vsphere.id
        control_plane_role           = true
        etcd_role                    = true
        worker_role                  = true
        quantity                     = var.control_plane_node_count
        drain_before_delete          = true

        machine_config {
          kind = rancher2_machine_config_v2.cp_config.kind
          name = rancher2_machine_config_v2.cp_config.name
        }
      }
    }

    dynamic "machine_pools" {
      for_each = var.worker_node_count > 0 ? [1] : []
      content {
        name                         = "worker"
        cloud_credential_secret_name = rancher2_cloud_credential.vsphere.id
        control_plane_role           = false
        etcd_role                    = false
        worker_role                  = true
        quantity                     = var.worker_node_count
        drain_before_delete          = true

        machine_config {
          kind = rancher2_machine_config_v2.worker_config.kind
          name = rancher2_machine_config_v2.worker_config.name
        }
      }
    }
  }
}
