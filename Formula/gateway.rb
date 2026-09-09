class Gateway < Formula
  desc "Self-hosted AI governance gateway — JWT, scope, secret-scan, blocklist, rate-limit on every tool call"
  homepage "https://systemprompt.io"
  license "MIT"
  version "0.48.0"

  on_macos do
    url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.48.0/systemprompt-gateway-0.48.0-darwin-arm64.tar.gz"
    sha256 "516b9d953cacddda01014ca5ab7ee450bee189960b77f2115806317d4b44dc9c"
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.48.0/systemprompt-gateway-0.48.0-linux-amd64.tar.gz"
      sha256 "cc2c403db1508209f32b4226ae6df422953d03741e7819e3a24a6bb6b7b6e1aa"
    end
    on_arm do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.48.0/systemprompt-gateway-0.48.0-linux-arm64.tar.gz"
      sha256 "3eab6a22df4975839bd79845f6fd3102658c5a18beb40be81594d185adf0475c"
    end
  end

  def install
    bin.install "systemprompt"
    bin.install "systemprompt-mcp-agent"
    libexec.install "services"
    libexec.install "web" if File.exist?("web")
    libexec.install "storage"
    libexec.install "demo"
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
