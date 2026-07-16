class Gateway < Formula
  desc "Self-hosted AI governance gateway — JWT, scope, secret-scan, blocklist, rate-limit on every tool call"
  homepage "https://systemprompt.io"
  license "MIT"
  version "0.21.0"

  on_macos do
    url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.21.0/systemprompt-gateway-0.21.0-darwin-arm64.tar.gz"
    sha256 "98866760587fd0f8e81cd220b1e90351d7b907e0ee724c2d2727f63dd6b7df34"
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.21.0/systemprompt-gateway-0.21.0-linux-amd64.tar.gz"
      sha256 "241266b371e2341924975fa8ab0ff19a3b63c96949a999727e7371f76c79191c"
    end
    on_arm do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.21.0/systemprompt-gateway-0.21.0-linux-arm64.tar.gz"
      sha256 "65b2cb097c2a76c5918a880159517cde69a139ca984e1f592bec3b203bed6fa0"
    end
  end

  def install
    bin.install "systemprompt"
    bin.install "systemprompt-mcp-agent"
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
