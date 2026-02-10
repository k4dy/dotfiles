return {
  -- Custom Java code runner
  {
    "java-runner",
    dir = vim.fn.stdpath("config"),
    config = function()
      -- Function to run Java code in horizontal split
      local function run_java()
        -- Save the current file
        vim.cmd("write")

        -- Get current file name and path
        local file = vim.fn.expand("%:p")
        local filename = vim.fn.expand("%:t")

        -- Check if it's a Java file
        if not filename:match("%.java$") then
          print("Not a Java file!")
          return
        end

        -- Read the file to find package declaration and class name
        local package_name = ""
        local first_lines = vim.fn.readfile(file, "", 20)
        for _, line in ipairs(first_lines) do
          local pkg = line:match("^package%s+([%w%.]+);")
          if pkg then
            package_name = pkg
            break
          end
        end

        local class_name = filename:gsub("%.java$", "")
        local full_class_name = package_name ~= "" and (package_name .. "." .. class_name) or class_name

        -- Find project root (directory containing pom.xml)
        local project_root = vim.fn.findfile("pom.xml", ".;")
        if project_root == "" then
          print("No pom.xml found! Not a Maven project.")
          return
        end
        project_root = vim.fn.fnamemodify(project_root, ":h")

        -- Calculate 50% of screen height
        local screen_height = vim.o.lines
        local terminal_height = math.floor(screen_height * 0.5)

        -- Open horizontal split at bottom with terminal (50% height)
        vim.cmd(string.format("botright %dsplit | terminal", terminal_height))

        -- Use Maven to compile and run
        local cmd = string.format("cd %s && mvn compile exec:java -Dexec.mainClass=\"%s\"\n",
          project_root, full_class_name)

        -- Send commands to compile and run
        vim.api.nvim_chan_send(vim.bo.channel, cmd)

        -- Cursor stays in terminal window (removed wincmd p)
      end

      -- Function to open terminal in horizontal split
      local function open_terminal()
        -- Calculate 50% of screen height
        local screen_height = vim.o.lines
        local terminal_height = math.floor(screen_height * 0.5)

        -- Open horizontal split at bottom with terminal (50% height)
        vim.cmd(string.format("botright %dsplit | terminal", terminal_height))

        -- Enter insert mode in terminal automatically
        vim.cmd("startinsert")
      end

      -- Set keybindings
      vim.keymap.set("n", "<leader>rj", run_java, { desc = "Run Java file" })
      vim.keymap.set("n", "<leader>rt", open_terminal, { desc = "Open Terminal" })
    end,
  },
}
