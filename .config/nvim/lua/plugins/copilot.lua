return {
  "zbirenbaum/copilot.lua",
  opts = {
    filetypes = {
      markdown = false,
    },
    server_opts_overrides = {
      settings = {
        advanced = {
          debug = {
            githubCTSIntegrationEnabled = false,
          },
        },
        telemetry = {
          telemetryLevel = "off",
        },
      },
    },
  },
}
