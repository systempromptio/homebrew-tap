class Gateway < Formula
  desc "Self-hosted AI governance gateway — JWT, scope, secret-scan, blocklist, rate-limit on every tool call"
  homepage "https://systemprompt.io"
  license "MIT"
  version "0.29.0"

  on_macos do
    url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.29.0/systemprompt-gateway-0.29.0-darwin-arm64.tar.gz"
    sha256 "4b4ee779222bec9b2002865f8aba94ad1994245f595668f5d5a08d5620bd0b6d"
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.29.0/systemprompt-gateway-0.29.0-linux-amd64.tar.gz"
      sha256 "29ed28cf515a0c204a6d4bac77989118f5f1371247728e98dcf7d3afe32da1c7"
    end
    on_arm do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.29.0/systemprompt-gateway-0.29.0-linux-arm64.tar.gz"
      sha256 "384a9f7e06681c2e97b28e14550e79693123d50de2fb390adaf7c6375311c9ba"
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
