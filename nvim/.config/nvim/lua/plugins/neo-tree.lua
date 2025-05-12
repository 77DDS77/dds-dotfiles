return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    keys = {
        {
            "<C-b>",
            ":Neotree filesystem toggle right<CR>",
            desc = "Toggle Neo-tree",
        },
    },
    config = function()
        require("neo-tree").setup({
            filesystem = {
                follow_current_file = {
                    enabled = true,
                    leave_dirs_open = false,
                },
                use_libuv_file_watcher = true,
            },
            window = {
                width = 40,
            },
            bind_to_cwd = true,
            cwd_target = {
                sidebar = "window", -- o "tab"
                current = "window",
            },
            default_component_configs = {
                container = {
                    enable_character_fade = true,
                    auto_clean_after_change_cwd = true,
                },
            },
        })
    end,
}
