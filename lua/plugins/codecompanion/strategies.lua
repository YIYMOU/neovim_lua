return {
  cli = {
    agent = "claude_code_ttadk",
    agents = {
      claude_code_ttadk = {
        cmd = "ttadk",
        args = { "claude", "-m", "gpt-5.4" },
        description = "Claude Code via ttadk",
        provider = "terminal",
      },
    },
  },
  chat = {
    adapter = "zai",
    tools = {
      ["mcp"] = {
        opts = {
          servers = {
            -- 使用 MCP (Model Context Protocol) 的文件系统服务配置
            ["filesystem"] = {
              cmd = "npx",
              args = { "-y", "@modelcontextprotocol/server-filesystem", vim.fn.getcwd() },
            },
          },
        },
      },
      opts = {
        default_tools = {
          "run_command",
          "insert_edit_into_file",
          "read_file",
          "create_file",
          "web_search",
          "fetch_webpage",
          -- "full_stack_dev"
        },
      },
    },
  },
  -- inline = { adapter = "minimax" },
  inline = { adapter = "deepseek" },
}
