# websearch-mcp-tool (Homebrew Formula)

Homebrew formula for [`websearch-mcp-tool`](https://codeberg.org/amoAHCP/web-mcp) — a
lightweight MCP tool for web search and content fetching.

The formula lives in [`websearch-mcp-tool.rb`](websearch-mcp-tool.rb) and installs the
native macOS executable that is published as a release artifact on Codeberg.

## Release Runbook

Follow these steps to cut a new release and update the Homebrew formula.

### 1. Build the tool natively

Build the native macOS executable as described in the upstream project:
<https://codeberg.org/amoAHCP/web-mcp>

```sh
# From the web-mcp repository (requires GraalVM JDK 25+ with native-image)
mvn -pl websearch-mcp-tool -Pnative clean native:compile -DskipTests
```

The resulting binary is written to `websearch-mcp-tool/target/websearch-mcp-tool`.

> Note: GraalVM native images are platform-specific — the macOS artifact must be built on macOS.

### 2. Package the executable

Create the release tarball from the built `websearch-mcp-tool` binary:

```sh
tar -czvf websearch-mcp-tool-macos.tar.gz websearch-mcp-tool
```

### 3. Compute the SHA-256 checksum

```sh
openssl sha256 websearch-mcp-tool-macos.tar.gz
```

Copy the resulting hash — it is required in the next step.

### 4. Update the formula with the new SHA

Edit [`websearch-mcp-tool.rb`](websearch-mcp-tool.rb) and replace the `sha256` value
(and the `url`, if the release version changed) with the checksum from step 3.

```ruby
url "https://codeberg.org/amoAHCP/web-mcp/releases/download/v1.0/websearch-mcp-tool-macos.tar.gz"
sha256 "<new-sha256-from-step-3>"
```

### 5. Upload the artifact to Codeberg

Go to <https://codeberg.org/amoAHCP/web-mcp/releases> and upload the file:

```
websearch-mcp-tool-macos.tar.gz
```

Make sure the `url` in the formula points at the uploaded artifact.

### 6. Push the formula to GitHub

Commit and push the updated formula to the tap repository:

```sh
git add websearch-mcp-tool.rb
git commit -m "Update websearch-mcp-tool to new release"
git push https://github.com/amoAHCP/websearch-mcp-tool.git
```

### 7. Uninstall the previous version

```sh
brew uninstall websearch-mcp-tool
```

### 8. Install the new version

```sh
brew install websearch-mcp-tool
```
