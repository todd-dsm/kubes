module "kubernetes" {
  source  = "git::https://github.com/poseidon/typhoon//aws/container-linux/kubernetes"
  version = "1.10.3"

  # Influenced by providers.tf
  providers = {
    aws = "aws.default"
  }

  asset_dir          = "${var.asset_dir}"
  cluster_name       = "${var.cluster_name}"
  dns_zone           = "${var.dns_zone}"
  dns_zone_id        = "${var.dns_zone_id}"
  ssh_authorized_key = "${var.ssh_authorized_key}"

  # optional
  host_cidr             = "10.0.0.0/16"
  controller_count      = 1
  worker_count          = 1
  cluster_domain_suffix = "cluster.local"
  disk_size             = 40

  # TODO: reserach AWS/jumbo frames
  #networking            = "calico"
  #network_mtu           = 8981
}
