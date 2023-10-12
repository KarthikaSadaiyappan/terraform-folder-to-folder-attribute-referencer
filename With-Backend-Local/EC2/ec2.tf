data "terraform_remote_state" "sg_source" {
  backend = "local"
  config = {
    path = "../SG/terraform.tfstate"
  }
}

resource "aws_instance" "aws_res_ref" {
  ami           = "ami-0c42696027a8ede58"
  instance_type = "t3.nano"
  security_groups = [data.terraform_remote_state.sg_source.outputs.sg_name]

}