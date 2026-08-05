class Gateway < Formula
  desc "Self-hosted AI governance gateway — JWT, scope, secret-scan, blocklist, rate-limit on every tool call"
  homepage "https://systemprompt.io"
  license "MIT"
  version "0.29.0"

  on_macos do
    url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.29.0/systemprompt-gateway-0.29.0-darwin-arm64.tar.gz"
    sha256 "8f84bbcf894477437e194ad164b9f954b9f75dd2198bc2b779f0b5453cff46a6"
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.29.0/systemprompt-gateway-0.29.0-linux-amd64.tar.gz"
      sha256 "aed490d0dda39a9faaca5fca03be1da2a9c27725145eebb53a2f41b5f12f9362"
    end
    on_arm do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.29.0/systemprompt-gateway-0.29.0-linux-arm64.tar.gz"
      sha256 "c307824cb6172419856e4099297fd9710472f8ba2f9ea9ef1e48572fd390ef88"
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
