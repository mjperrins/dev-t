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
variable "cluster_worker_count" {
  type = number
  description = "The number of worker nodes that should be provisioned for classic infrastructure"
  default = 
}
variable "cluster_machine_type" {
  type = string
  description = "(Deprecated, use VPC) The machine type that will be provisioned for classic infrastructure"
  default = ""
}
variable "cluster_flavor" {
  type = string
  description = "(Deprecated, use VPC) The machine type that will be provisioned for classic infrastructure"
  default = ""
}
variable "cluster_vlan_datacenter" {
  type = string
  description = "(Deprecated, use VPC) The datacenter that should be used for classic infrastructure provisioning"
  default = ""
}
variable "cluster_private_vlan_id" {
  type = string
  description = "(Deprecated, use VPC) The private vlan id that should be used for classic infrastructure provisioning"
  default = ""
}
variable "cluster_public_vlan_id" {
  type = string
  description = "(Deprecated, use VPC) The public vlan id that should be used for classic infrastructure provisioning"
  default = ""
}
variable "cluster_vpc_zone_count" {
  type = number
  description = "Number of vpc zones"
  default = 
}
variable "region" {
  type = string
  description = "The IBM Cloud region where the cluster will be/has been installed."
  default = ""
}
variable "cluster_type" {
  type = string
  description = "The type of cluster that should be created (openshift or ocp3 or ocp4 or kubernetes)"
  default = ""
}
variable "ibmcloud_api_key" {
  type = string
  description = "The IBM Cloud api token"
  default = ""
}
variable "cluster_exists" {
  type = bool
  description = "Flag indicating if the cluster already exists (true or false)"
  default = 
}
variable "cluster_login_user" {
  type = string
  description = "The username to log in to openshift"
  default = ""
}
variable "name_prefix" {
  type = string
  description = "The prefix name for the service. If not provided it will default to the resource group name"
  default = ""
}
variable "cluster_is_vpc" {
  type = bool
  description = "Flag indicating that the cluster uses vpc infrastructure"
  default = 
}
variable "cluster_ocp_entitlement" {
  type = string
  description = "Value that is applied to the entitlements for OCP cluster provisioning"
  default = ""
}
variable "cluster_cos_name" {
  type = string
  description = "(optional) The name of the cos instance that will be used for the OCP 4 vpc instance"
  default = ""
}
variable "cluster_provision_cos" {
  type = bool
  description = "Flag indicating that the cos instance should be provisioned, if necessary"
  default = 
}
variable "gitops_dir" {
  type = string
  description = "Directory where the gitops repo content should be written"
  default = ""
}
variable "argocd_name" {
  type = string
  description = "The name for the instance"
  default = ""
}
variable "argocd_operator_version" {
  type = string
  description = "The starting version of the CSV"
  default = ""
}
variable "namespace_name" {
  type = string
  description = "The namespace that should be created"
  default = ""
}
variable "artifactory_service_account" {
  type = string
  description = "The service account under which the artifactory pods should run"
  default = ""
}
variable "artifactory_chart_version" {
  type = string
  description = "The chart version that will be used for artifactory release"
  default = ""
}
variable "artifactory_storage_class" {
  type = string
  description = "The storage class of the persistence volume claim"
  default = ""
}
variable "artifactory_persistence" {
  type = bool
  description = "Flag to indicate if PVCs should be used"
  default = 
}
variable "artifactory_gitops_dir" {
  type = string
  description = "Directory where the gitops repo content should be written"
  default = ""
}
variable "artifactory_mode" {
  type = string
  description = "The mode of operation for the module (setup)"
  default = ""
}
variable "dashboard_tool_config_maps" {
  type = list(string)
  description = "The list of config maps containing connectivity information for tools"
  default = ""
}
variable "dashboard_image_tag" {
  type = string
  description = "The image version tag to use"
  default = ""
}
variable "dashboard_chart_version" {
  type = string
  description = "The helm chart version that should be installed from https://ibm-garage-cloud.github.io/toolkit-charts"
  default = ""
}
variable "dashboard_enable_sso" {
  type = bool
  description = "Flag indicating that ssl should be enabled (OpenShift only)"
  default = 
}
variable "dashboard_gitops_dir" {
  type = string
  description = "Directory where the gitops repo content should be written"
  default = ""
}
variable "dashboard_mode" {
  type = string
  description = "The mode of operation for the module (setup)"
  default = ""
}
variable "sonarqube_hostname" {
  type = string
  description = "The hostname that will be used for the ingress/route"
  default = ""
}
variable "sonarqube_helm_version" {
  type = string
  description = "The version of the helm chart that should be used"
  default = ""
}
variable "sonarqube_service_account_name" {
  type = string
  description = "The name of the service account that should be used for the deployment"
  default = ""
}
variable "sonarqube_plugins" {
  type = list(string)
  description = "The list of plugins that will be installed on SonarQube"
  default = ""
}
variable "sonarqube_volume_capacity" {
  type = string
  description = "The volume capacity of the persistence volume claim"
  default = ""
}
variable "sonarqube_storage_class" {
  type = string
  description = "The storage class of the persistence volume claim"
  default = ""
}
variable "sonarqube_postgresql" {
  type = object({
  description = "Properties for an existing postgresql database"
  default = ""
}
variable "sonarqube_gitops_dir" {
  type = string
  description = "Directory where the gitops repo content should be written"
  default = ""
}
variable "sonarqube_mode" {
  type = string
  description = "The mode of operation for the module (setup)"
  default = ""
}

variable "swaggereditor_enable_sso" {
  type = bool
  description = "Flag indicating if oauth should be applied (only available for OpenShift)"
  default = 
}
variable "swaggereditor_chart_version" {
  type = string
  description = "The version of the helm chart that will be installed"
  default = ""
}
variable "mode" {
  type = string
  description = "The mode of operation for the module (setup)"
  default = ""
}
variable "registry_namespace" {
  type = string
  description = "The namespace that will be created in the IBM Cloud image registry. If not provided the value will default to the resource group"
  default = ""
}
variable "registry_registry_password" {
  type = string
  description = "The password (API key) to authenticate to the IBM Container Registry. If not provided the value will default to `var.ibmcloud_api_key`"
  default = ""
}
variable "git_type" {
  type = string
  description = "The type of source control system (github or gitlab) currently"
  default = ""
}
variable "git_url" {
  type = string
  description = "The url to the git host (base git host, org, or repo url)"
  default = ""
}
