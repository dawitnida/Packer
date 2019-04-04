workflow "Packer" {
  resolves = "packer-validate"
  on = "pull_request"
}

action "filter-open-synced-pr" {
  uses = "actions/bin/filter@master"
  args = "action 'opened|synchronize'"
}

action "packer-validate" {
  uses = "dawitnida/packer-github-actions/validate@master"
  needs = "filter-open-synced-pr"
  secrets = [
    "GITHUB_TOKEN",
  ]
  args = "TEMPLATE_FILE_NAME"
  env = {
    ACTION_COMMENT = "1"
    TEMPLATE_FILE_NAME = "demo-2.json"
  }
}
