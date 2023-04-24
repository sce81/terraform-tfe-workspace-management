locals {
      auto_apply = contains(var.workspace_tags, "production") == true ? false : true
}
