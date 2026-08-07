class Gateway < Formula
  desc "Self-hosted AI governance gateway — JWT, scope, secret-scan, blocklist, rate-limit on every tool call"
  homepage "https://systemprompt.io"
  license "MIT"
  version "0.30.1"

  on_macos do
    url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.30.1/systemprompt-gateway-0.30.1-darwin-arm64.tar.gz"
    sha256 "545b981896e24b32d5a99cb9848e510b8111c3e7da6c3be98b934435ff3c6680"
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.30.1/systemprompt-gateway-0.30.1-linux-amd64.tar.gz"
      sha256 "64aac96ee9aec18670c9b6f99a9cacd4fcf98b5a78a949ac8ea798d64512052d"
    end
    on_arm do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.30.1/systemprompt-gateway-0.30.1-linux-arm64.tar.gz"
      sha256 "f84f3ec68a8a854e46da725555cffc77dc7b0ad8c9cab25a303211ea1cc8dcb2"
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
