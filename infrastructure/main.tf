provider "netlify" {
  token = "${var.netlify_token}"
}

resource "netlify_site" netlify_site {
  name = "${var.app_name}"
  custom_domain = "${var.site_name}"
  repo {
    provider = "github"
    command = "scripts/build.sh"
    dir = "build"
    repo_path = "ajcrites/reading-list"
    repo_branch = "master"
  }
}

terraform {
  backend "s3" {}
}