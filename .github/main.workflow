workflow "Validate Packer Template" {
    resolves = "packer-validate-centos"
    on = "push"
}

action "packer-validate-centos" {
    uses = "dawitnida/packer-validate-action@master"
    secrets = [
        "GITHUB_TOKEN",
    ]
    env = {
        TEMPLATE_FILE_NAME = "*.hcl"
        PACKER_ACTION_WORKING_DIR = "centos"
    }
}

workflow "Validate Packer Template" {
    resolves = "packer-validate-ubuntu"
    on = "push"
}

action "packer-validate-ubuntu" {
    uses = "dawitnida/packer-validate-action@master"
    secrets = [
        "GITHUB_TOKEN",
    ]
    env = {
        TEMPLATE_FILE_NAME = "*.hcl"
        PACKER_ACTION_WORKING_DIR = "ubuntu"
    }
}