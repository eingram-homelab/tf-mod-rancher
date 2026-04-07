terraform {
  required_version = ">= 1.14.0"

  required_providers {
    rancher2 = {
      source  = "rancher/rancher2"
      version = "~> 3.0"
    }
  }
}
