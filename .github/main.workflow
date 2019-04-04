workflow "Packer" {
  resolves = "packer-validate"
  on = "pull_request"
}

action "filter-open-synced-pr" {
  uses = "actions/bin/filter@master"
  args = "action 'opened|synchronize'"
}

action "packer-validate" {
  uses = "dawitnida/packer-github-actions/validate@v0.1.3"
  needs = "filter-open-synced-pr"
  secrets = ["GITHUB_TOKEN"]
  args = "*.json"
}
