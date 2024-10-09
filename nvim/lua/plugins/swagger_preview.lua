-- :SwaggerPreview
-- :SwaggerPreviewStop
-- :SwaggerPreviewToggle
-- build = "npm install -g swagger-ui-watcher",
return {
    "vinnymeller/swagger-preview.nvim",
    lazy = false,
    config = function()
      require("swagger-preview").setup({
          -- The port to run the preview server on
          port = 8000,
          -- The host to run the preview server on
          host = "localhost",
      })
    end
}
