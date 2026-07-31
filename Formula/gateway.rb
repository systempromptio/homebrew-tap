class Gateway < Formula
  desc "Self-hosted AI governance gateway — JWT, scope, secret-scan, blocklist, rate-limit on every tool call"
  homepage "https://systemprompt.io"
  license "MIT"
  version "0.28.0"

  on_macos do
    url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.28.0/systemprompt-gateway-0.28.0-darwin-arm64.tar.gz"
    sha256 "6624d89ed9336637dd7ed436c52e7a36cfc05e7ed2b3c37279f0c7728c2ecd98"
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.28.0/systemprompt-gateway-0.28.0-linux-amd64.tar.gz"
      sha256 "c441ec466a870ba41db249d7bf96eaa89bcd11d1745534a087f2eec89e9ae8df"
    end
    on_arm do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.28.0/systemprompt-gateway-0.28.0-linux-arm64.tar.gz"
      sha256 "438b804485e028fa58c14ee56762f0a9d13e301e3284c0b66a1f4125bb46fdbf"
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
