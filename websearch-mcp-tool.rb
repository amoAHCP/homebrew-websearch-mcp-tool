class WebsearchMcpTool < Formula
  desc "Lightweight MCP tool for web search and content fetching"
  homepage "https://codeberg.org/amoAHCP/web-mcp"
  url "https://codeberg.org/amoAHCP/web-mcp/releases/download/v1.1/websearch-mcp-tool-macos.tar.gz"
  sha256 "72afdb9396f46faf9586ae025eb4b770b8630aecb507b56c39fbdf927ea7640b"

  def install
    bin.install "websearch-mcp-tool"
  end

  test do
    system "#{bin}/websearch-mcp-tool", "--version"
  end
end