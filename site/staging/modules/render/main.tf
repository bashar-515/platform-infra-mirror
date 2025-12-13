resource "render_static_site" "main" {
    branch = "main"
    build_command = "bash etc/scripts/build.sh"
    name = "platform"
    repo_url = "https://github.com/bashar-515/platform-site"

    auto_deploy = true

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

    publish_path = "dist"
}
