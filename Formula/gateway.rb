class Gateway < Formula
  desc "Self-hosted AI governance gateway — JWT, scope, secret-scan, blocklist, rate-limit on every tool call"
  homepage "https://systemprompt.io"
  license "MIT"
  version "0.5.0"

  on_macos do
    url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.5.0/systemprompt-gateway-0.5.0-darwin-arm64.tar.gz"
    sha256 "7c1be8086396c82a753ccb3ad84429e1bde549dc80fc04d446d9a0a57bae5e6a"
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.5.0/systemprompt-gateway-0.5.0-linux-amd64.tar.gz"
      sha256 "3ee08102f0f5a1135ffb1a34a8231111dc6cbef4b94c63b8b576fbe6de3ec3ce"
    end
    on_arm do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.5.0/systemprompt-gateway-0.5.0-linux-arm64.tar.gz"
      sha256 "d918829aedb2288a48e0187ff140ec2e93fb02744801ca58e6a34501c3d26d7d"
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
