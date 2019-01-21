workflow "Package a Ruby gem" {
  on = "release"
  resolves = ["Push them Gem"]
}

action "Build the Gem" {
  uses = "scarhand/actions-ruby@master"
  args = "build *.gemspec"
}

action "Push them Gem" {
  uses = "scarhand/actions-ruby@master"
  needs = ["Build the Gem"]
  args = "push *.gem"
  secrets = ["RUBYGEMS_AUTH_TOKEN"]
}
