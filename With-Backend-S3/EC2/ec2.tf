data "terraform_remote_state" "sg_source" {
  backend = "s3"
  config = {
    bucket = "terraform-state-files-versioned"
    key    = "demo/resrefstatefile/terraform.tfstate"
    region = "ap-south-1"
    profile = "my-admin-profile"
  }
}

resource "aws_instance" "aws_res_ref" {
  ami           = "ami-0c42696027a8ede58"
  instance_type = "t3.nano"
  security_groups = [data.terraform_remote_state.sg_source.outputs.sg_name]

}