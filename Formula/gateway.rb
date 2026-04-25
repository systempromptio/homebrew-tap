class Gateway < Formula
  desc "Self-hosted AI governance gateway — JWT, scope, secret-scan, blocklist, rate-limit on every tool call"
  homepage "https://systemprompt.io"
  license "MIT"
  version "0.4.0"
  url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.4.0/systemprompt-gateway-0.4.0-darwin-arm64.tar.gz"
  sha256 "40fb9f0dbf716987964d66b1058eec6a4676a86116a1696160e1ccd8256691b0"

  def install
    bin.install "systemprompt"
    bin.install "systemprompt-mcp-agent"
    bin.install "systemprompt-mcp-marketplace"
    libexec.install "services", "migrations"
    libexec.install "web" if File.exist?("web")
    libexec.install "extensions" if File.exist?("extensions")
  end

  service do
    run [opt_bin/"systemprompt", "infra", "services", "start", "--foreground"]
    keep_alive true
    log_path var/"log/systemprompt.log"
    error_log_path var/"log/systemprompt.err.log"
  end

  test do
    system "#{bin}/systemprompt", "--version"
  end
end
