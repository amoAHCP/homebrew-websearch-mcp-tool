class WebsearchMcpTool < Formula
  desc "Lightweight MCP tool for web search and content fetching"
  homepage "https://codeberg.org/amoAHCP/web-mcp"
  url "https://codeberg.org/amoAHCP/web-mcp/releases/download/v1.1/websearch-mcp-tool-macos.tar.gz"
  sha256 "7cd2f18757246525d3788ef69cce4da017fcc0be0b3559cb6b1e018f7e7e34f4"

  def install
    bin.install "websearch-mcp-tool"
  end

  test do
    system "#{bin}/websearch-mcp-tool", "--version"
  end
end