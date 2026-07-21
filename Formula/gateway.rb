class Gateway < Formula
  desc "Self-hosted AI governance gateway — JWT, scope, secret-scan, blocklist, rate-limit on every tool call"
  homepage "https://systemprompt.io"
  license "MIT"
  version "0.22.0"

  on_macos do
    url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.22.0/systemprompt-gateway-0.22.0-darwin-arm64.tar.gz"
    sha256 "a4867d39138d1378877913cc2ed0997fe060ba0e9da9e8f95a6df4ad0804ed05"
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.22.0/systemprompt-gateway-0.22.0-linux-amd64.tar.gz"
      sha256 "466ab68b3c483565c003eb08d3162c1abb525cb681001a89e499fd7dc2c995c8"
    end
    on_arm do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.22.0/systemprompt-gateway-0.22.0-linux-arm64.tar.gz"
      sha256 "886a3aef8564f69d88f2bf984f5dc87067be6fe3accdc15e662ba781426ed642"
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
