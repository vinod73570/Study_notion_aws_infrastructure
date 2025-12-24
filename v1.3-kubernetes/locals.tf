locals {
  private_subnets = data.terraform_remote_state.networking.outputs.private_subnet_ids

  control_plane_subnet_map = {
    for idx, subnet_id in local.private_subnets :
    idx => subnet_id
  }
}



