class WebsearchMcpTool < Formula
  desc "Lightweight MCP tool for web search and content fetching"
  homepage "https://codeberg.org/amoAHCP/web-mcp"
  url "https://codeberg.org/amoAHCP/web-mcp/releases/download/v1.2/websearch-mcp-tool-macos.tar.gz"
  sha256 "be4aee98cd18b609476d0caa8b19ba409f44f80604e266de821cb50f56d56b31"

  def install
    bin.install "websearch-mcp-tool"
  end

  test do
    system "#{bin}/websearch-mcp-tool", "--version"
  end
end