class Gateway < Formula
  desc "Self-hosted AI governance gateway — JWT, scope, secret-scan, blocklist, rate-limit on every tool call"
  homepage "https://systemprompt.io"
  license "MIT"
  version "0.31.0"

  on_macos do
    url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.31.0/systemprompt-gateway-0.31.0-darwin-arm64.tar.gz"
    sha256 "c14fffe8b01b35a1e759470e422acb13462645a173afb49f21cfd9a5dadb16fb"
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.31.0/systemprompt-gateway-0.31.0-linux-amd64.tar.gz"
      sha256 "abf9ccc2a0b6ad0d8ebd3f2c4e6e449f4709dffc6a5f9bd88e8889c16e141130"
    end
    on_arm do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.31.0/systemprompt-gateway-0.31.0-linux-arm64.tar.gz"
      sha256 "0627457de6bb888583daf7cdf46c357c0bf2a9017c4a3531548ec0c3359022fa"
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
