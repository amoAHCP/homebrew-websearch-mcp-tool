class WebsearchMcpTool < Formula
  desc "Lightweight MCP tool for web search and content fetching"
  homepage "https://codeberg.org/amoAHCP/web-mcp"
  url "https://codeberg.org/amoAHCP/web-mcp/releases/download/v1.0/websearch-mcp-tool-macos.tar.gz"
  sha256 "e6b74beabe754c674cf79bc2304b6056da4b110f3198add47ad4f5e4e748afd7"

  def install
    bin.install "websearch-mcp-tool"
  end

  test do
    system "#{bin}/websearch-mcp-tool", "--version"
  end
end