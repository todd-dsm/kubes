# Update this file to override Typhoon defaults in the module
# Docs/Typhoon:   https://typhoon.psdn.io/cl/aws/#provider
# Docs/Terraform: https://www.terraform.io/docs/modules/usage.html#passing-providers-explicitly
provider "aws" {
  alias  = "default"
  region = "us-west-2"
}
