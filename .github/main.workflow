workflow "textlint" {
  resolves = "danger"
  on = "pull_request"
}

action "npm install" {
  uses = "actions/npm@c555744"
  args = "install"
}

action "danger" {
  needs = ["npm install"]
  uses = "yuichielectric/danger-textlint-actions@master"
  secrets = ["GITHUB_TOKEN"]
}
