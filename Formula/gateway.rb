class Gateway < Formula
  desc "Self-hosted AI governance gateway — JWT, scope, secret-scan, blocklist, rate-limit on every tool call"
  homepage "https://systemprompt.io"
  license "MIT"
  version "0.38.0"

  on_macos do
    url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.38.0/systemprompt-gateway-0.38.0-darwin-arm64.tar.gz"
    sha256 "80899c3007cd7cb86a3c8174dd7287908413ed0b461ed817a84871a47ef10d82"
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.38.0/systemprompt-gateway-0.38.0-linux-amd64.tar.gz"
      sha256 "9506ea86de98137665992e6b7ab9cea212d9483c1d6a83d969f7973e619f5563"
    end
    on_arm do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.38.0/systemprompt-gateway-0.38.0-linux-arm64.tar.gz"
      sha256 "98820095fe21b3d9dd6250844398cc65373e931fc6fddfb272bec9f7d1f6cb21"
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
