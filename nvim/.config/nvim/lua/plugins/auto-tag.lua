return {
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte", "angular.html" },
    config = function ()
        require("nvim-ts-autotag").setup({
            opts = {
                enable_close = true,
                enable_rename = true,
                enable_close_on_slash = false,
            },
            aliases = {
                ["angular.html"] = "html",
                ["javascriptreact"] = "html"
            }
        })
    end
}
