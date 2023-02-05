provider "google" {
  credentials = file(var.credentials_path)
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

module "vpc" {
  source = "./modules/network"
}

module "demoapp" {
  source           = "./modules/instances"
  network_name     = module.vpc.network_name
  instance_name    = "demoapp"
  ssh_user         = var.ssh_user
  ssh_pub_key_path = var.ssh_pub_key_path
}

module "moni" {
  source           = "./modules/instances"
  network_name     = module.vpc.network_name
  instance_name    = "moni"
  ssh_user         = var.ssh_user
  ssh_pub_key_path = var.ssh_pub_key_path
}
