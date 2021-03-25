module "cluster" {
  source = "github.com/ibm-garage-cloud/terraform-ibm-container-platform?ref=v1.20.8"

  resource_group_name = var.resource_group_name
  cluster_name = var.cluster_name
  cluster_hardware = var.cluster_hardware
  cluster_worker_count = var.cluster_worker_count
  cluster_machine_type = var.cluster_machine_type
  flavor = var.cluster_flavor
  vlan_datacenter = var.cluster_vlan_datacenter
  private_vlan_id = var.cluster_private_vlan_id
  public_vlan_id = var.cluster_public_vlan_id
  vpc_zone_count = var.cluster_vpc_zone_count
  cluster_region = var.region
  cluster_type = var.cluster_type
  ibmcloud_api_key = var.ibmcloud_api_key
  cluster_exists = var.cluster_exists
  login_user = var.cluster_login_user
  name_prefix = var.name_prefix
  is_vpc = var.cluster_is_vpc
  ocp_entitlement = var.cluster_ocp_entitlement
  cos_name = var.cluster_cos_name
  provision_cos = var.cluster_provision_cos
  gitops_dir = var.gitops_dir

}
module "argocd" {
  source = "github.com/ibm-garage-cloud/terraform-tools-argocd?ref=v2.10.1"

  cluster_type = module.cluster.type_code
  ingress_subdomain = module.cluster.ingress_hostname
  cluster_config_file = module.cluster.config_file_path
  olm_namespace = module.olm.olm_namespace
  operator_namespace = module.olm.target_namespace
  app_namespace = module.namespace.name
  name = var.argocd_name
  operator_version = var.argocd_operator_version

}
module "olm" {
  source = "github.com/ibm-garage-cloud/terraform-k8s-olm?ref=v1.2.3"

  cluster_config_file = module.cluster.config_file_path
  cluster_type = module.cluster.platform
  cluster_version = module.cluster.platform

}
module "namespace" {
  source = "github.com/ibm-garage-cloud/terraform-k8s-namespace?ref=v2.7.2"

  cluster_type = module.cluster.type_code
  cluster_config_file_path = module.cluster.config_file_path
  tls_secret_name = module.cluster.tls_secret_name
  name = var.namespace_name

}
module "artifactory" {
  source = "github.com/ibm-garage-cloud/terraform-tools-artifactory?ref=v1.10.1"

  cluster_type = module.cluster.type_code
  cluster_ingress_hostname = module.cluster.ingress_hostname
  cluster_config_file = module.cluster.config_file_path
  tls_secret_name = module.cluster.tls_secret_name
  releases_namespace = module.namespace.name
  service_account = var.artifactory_service_account
  chart_version = var.artifactory_chart_version
  storage_class = var.artifactory_storage_class
  persistence = var.artifactory_persistence
  gitops_dir = var.artifactory_gitops_dir
  mode = var.artifactory_mode

}
module "dashboard" {
  source = "github.com/ibm-garage-cloud/terraform-tools-dashboard?ref=v1.10.10"

  cluster_type = module.cluster.type_code
  cluster_ingress_hostname = module.cluster.ingress_hostname
  cluster_config_file = module.cluster.config_file_path
  tls_secret_name = module.cluster.tls_secret_name
  releases_namespace = module.namespace.name
  tool_config_maps = var.dashboard_tool_config_maps
  image_tag = var.dashboard_image_tag
  chart_version = var.dashboard_chart_version
  enable_sso = var.dashboard_enable_sso
  gitops_dir = var.dashboard_gitops_dir
  mode = var.dashboard_mode

}
module "pactbroker" {
  source = "github.com/ibm-garage-cloud/terraform-tools-pactbroker?ref=v1.4.2"

  cluster_type = module.cluster.type_code
  cluster_ingress_hostname = module.cluster.ingress_hostname
  cluster_config_file = module.cluster.config_file_path
  tls_secret_name = module.cluster.tls_secret_name
  releases_namespace = module.namespace.name

}
module "sonarqube" {
  source = "github.com/ibm-garage-cloud/terraform-tools-sonarqube?ref=v1.9.2"

  cluster_type = module.cluster.type_code
  cluster_ingress_hostname = module.cluster.ingress_hostname
  cluster_config_file = module.cluster.config_file_path
  tls_secret_name = module.cluster.tls_secret_name
  releases_namespace = module.namespace.name
  hostname = var.sonarqube_hostname
  helm_version = var.sonarqube_helm_version
  service_account_name = var.sonarqube_service_account_name
  plugins = var.sonarqube_plugins
  volume_capacity = var.sonarqube_volume_capacity
  storage_class = var.sonarqube_storage_class
  postgresql = var.sonarqube_postgresql
  gitops_dir = var.sonarqube_gitops_dir
  mode = var.sonarqube_mode

}
module "swaggereditor" {
  source = "github.com/ibm-garage-cloud/terraform-tools-swaggereditor?ref=v1.4.1"

  cluster_type = module.cluster.type_code
  cluster_ingress_hostname = module.cluster.ingress_hostname
  cluster_config_file = module.cluster.config_file_path
  tls_secret_name = module.cluster.tls_secret_name
  releases_namespace = module.namespace.name
  image_tag = var.swaggereditor_image_tag
  enable_sso = var.swaggereditor_enable_sso
  chart_version = var.swaggereditor_chart_version

}
module "tekton" {
  source = "github.com/ibm-garage-cloud/terraform-tools-tekton?ref=v2.1.1"

  cluster_type = module.cluster.type_code
  cluster_ingress_hostname = module.cluster.ingress_hostname
  cluster_config_file_path = module.cluster.config_file_path
  tools_namespace = module.namespace.name
  olm_namespace = module.olm.olm_namespace
  operator_namespace = module.olm.target_namespace
  gitops_dir = var.gitops_dir
  mode = var.mode

}
module "tekton-resources" {
  source = "github.com/ibm-garage-cloud/terraform-tools-tekton-resources?ref=v2.2.12"

  cluster_type = module.cluster.type_code
  cluster_config_file_path = module.cluster.config_file_path
  tekton_namespace = module.tekton.namespace
  resource_namespace = module.namespace.name

}
module "registry" {
  source = "github.com/ibm-garage-cloud/terraform-ibm-image-registry?ref=v1.4.0"

  config_file_path = module.cluster.config_file_path
  cluster_type_code = module.cluster.type_code
  cluster_namespace = module.namespace.name
  resource_group_name = var.resource_group_name
  registry_namespace = var.registry_namespace
  registry_password = var.registry_registry_password
  cluster_region = var.region
  gitops_dir = var.gitops_dir
  ibmcloud_api_key = var.ibmcloud_api_key

}
module "git" {
  source = "github.com/ibm-garage-cloud/terraform-k8s-source-control?ref=v1.2.3"

  cluster_type_code = module.cluster.type_code
  config_file_path = module.cluster.config_file_path
  cluster_namespace = module.namespace.name
  gitops_dir = var.gitops_dir
  type = var.git_type
  url = var.git_url

}
