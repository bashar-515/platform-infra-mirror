resource "render_static_site" "site" {
    branch = "main"
    build_command = "bash etc/scripts/build.sh"
    name = "" # TODO(bashar-515): name service
    repo_url = "https://codeberg.org/Platform-515/site"

    auto_deploy = true
    # auto_deploy_trigger TODO(bashar-515)

    build_filter = {
      paths = [
        "src/**",
         "etc/scripts/build.sh",
      ]
    }

    custom_domains = [
      { name: "beesho.dev" },
    ]

    env_vars = {
      PROJECT_BANANA_URL = {
        value = "https://project-banana.dev"
      }
      CYCAS_URL = {
        value = "https://cycas.dev"
      }
    }

    # environment_id TODO(bashar-515)
    publish_path = "dist"
}
