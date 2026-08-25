class Gateway < Formula
  desc "Self-hosted AI governance gateway — JWT, scope, secret-scan, blocklist, rate-limit on every tool call"
  homepage "https://systemprompt.io"
  license "MIT"
  version "0.39.0"

  on_macos do
    url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.39.0/systemprompt-gateway-0.39.0-darwin-arm64.tar.gz"
    sha256 "d286e132117d615ee1d45b32116610f811db0766209782fb481b8eb44ff6ef83"
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.39.0/systemprompt-gateway-0.39.0-linux-amd64.tar.gz"
      sha256 "003b608f7be5ecd71926103ae98a3aa15d7f09dcdf46dd80ff4dba13c1ed8609"
    end
    on_arm do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.39.0/systemprompt-gateway-0.39.0-linux-arm64.tar.gz"
      sha256 "b11a5dd78757783284e22de7a2867ed902b990e1d20b8d9fcfe669b11599f879"
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
