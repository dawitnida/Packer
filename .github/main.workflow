workflow "packer-validate-temp-x" {
  resolves = "packer-validate-demo-1"
  on = "pull_request"
}

action "filter-open-synced-pr" {
  uses = "actions/bin/filter@master"
  args = "action 'opened|synchronize'"
}

action "packer-validate-demo-1" {
  uses = "dawitnida/packer-github-actions/validate@master"
  needs = "filter-open-synced-pr"
  secrets = [
    "GITHUB_TOKEN",
  ]
  env = {
    TEMPLATE_FILE_NAME = "*.json"
    PACKER_ACTION_WORKING_DIR = "Dockers"
  }
}

workflow "packer-validate-temp-y" {
  resolves = "packer-validate-demo-2"
  on = "pull_request"
}

action "packer-validate-demo-2" {
  uses = "dawitnida/packer-github-actions/validate@master"
  needs = "filter-open-synced-pr"
  secrets = [
    "GITHUB_TOKEN",
  ]
  args = [
    "-var-file=global-vars.json",
  ]
  env = {
    TEMPLATE_FILE_NAME = "demo-2.json"
  }
}

workflow "packer-validate-temp-z" {
  resolves = "packer-validate-demo-3"
  on = "pull_request"
}

action "packer-validate-demo-3" {
  uses = "dawitnida/packer-github-actions/validate@master"
  needs = "filter-open-synced-pr"
  secrets = [
    "GITHUB_TOKEN",
  ]
  env = {
    TEMPLATE_FILE_NAME = "demo-docker-template.json"
  }
}
