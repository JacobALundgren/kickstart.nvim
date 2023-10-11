return {
    "epwalsh/obsidian.nvim",
    lazy = true,
    event = {
        "BufReadPre " .. vim.fn.expand "~" .. "/projects/rpg-obsidian/**.md",
        "BufNewFile " .. vim.fn.expand "~" .. "/projects/rpg-obsidian/**.md"
    },
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    opts = {
        dir = "~/projects/rpg-obsidian",
        note_id_func = function(title)
            -- Create note IDs in a Zettelkasten format with a timestamp and a prefix.
            -- In this case a note with the title 'My new note' will given an ID that looks
            -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
            local prefix = ""
            if title ~= nil then
              -- If title is given, transform it into valid file name.
              prefix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            else
              for _ = 1, 4 do
                prefix = prefix .. string.char(math.random(65, 90))
              end
            end
            return prefix .. "-" .. tostring(os.time())
        end,
    },
}
