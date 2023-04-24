locals {
      auto_apply = var.env_name != "production" ? true : false
}