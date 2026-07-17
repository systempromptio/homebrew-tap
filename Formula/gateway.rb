class Gateway < Formula
  desc "Self-hosted AI governance gateway — JWT, scope, secret-scan, blocklist, rate-limit on every tool call"
  homepage "https://systemprompt.io"
  license "MIT"
  version "0.21.1"

  on_macos do
    url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.21.1/systemprompt-gateway-0.21.1-darwin-arm64.tar.gz"
    sha256 "c3f65c3ec67e7ce84ada195a0c37717fc8a70f02def1847dedaffc8c13d074a2"
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.21.1/systemprompt-gateway-0.21.1-linux-amd64.tar.gz"
      sha256 "3fa1aa7360fc32b2cbbea69e32d9fc2552b729967f5f23fbf41030bfb1c3610d"
    end
    on_arm do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.21.1/systemprompt-gateway-0.21.1-linux-arm64.tar.gz"
      sha256 "42468558a5d653be363e610d29c873b844b57bc4ef843373080bc2b06018249d"
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
