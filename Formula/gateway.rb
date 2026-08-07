class Gateway < Formula
  desc "Self-hosted AI governance gateway — JWT, scope, secret-scan, blocklist, rate-limit on every tool call"
  homepage "https://systemprompt.io"
  license "MIT"
  version "0.30.0"

  on_macos do
    url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.30.0/systemprompt-gateway-0.30.0-darwin-arm64.tar.gz"
    sha256 "7e5a1b99a5dbc2e4ecf473c7f4259548e0e0b2428fff110ea92e6571dc2ab984"
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.30.0/systemprompt-gateway-0.30.0-linux-amd64.tar.gz"
      sha256 "f930b69a814689823d103be5b51ba5c7c5bd3475e5249013a2ed3e9cc5ff84ac"
    end
    on_arm do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.30.0/systemprompt-gateway-0.30.0-linux-arm64.tar.gz"
      sha256 "3b5ccd613cb7331e976c8680bfff917df04b2b6a0eb5f8a7495f9b70eff6ae11"
    end
  end

  def install
    bin.install "systemprompt"
    bin.install "systemprompt-mcp-agent"
    libexec.install "services"
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
