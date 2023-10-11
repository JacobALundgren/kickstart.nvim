return {
    "tanvirtin/monokai.nvim",
    config = function()
        require('monokai').setup{
            palette = {
                base2 = '#121212'
            },
            custom_hlgroups = {},
        }
    end,
}
