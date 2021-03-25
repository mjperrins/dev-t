variable "resource_group_name" {
  type = string
  description = "The name of the IBM Cloud resource group where the cluster will be created/can be found."
  default = ""
}
variable "cluster_name" {
  type = string
  description = "The name of the cluster that will be created within the resource group"
  default = ""
}
variable "cluster_hardware" {
  type = string
  description = "The type of hardware for the cluster (shared, dedicated)"
  default = ""
}
