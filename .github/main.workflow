workflow "New workflow" {
  resolves = "danger"
  on = "pull_request"
}

action "debug" {
  needs = ["npm install"]
  uses = "actions/bin/debug@master"
}

action "ls" {
  uses = "actions/bin/sh@master"
  args = ["ls -l ./node_modules"]
  needs = ["debug"]
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
