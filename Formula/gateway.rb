class Gateway < Formula
  desc "Self-hosted AI governance gateway — JWT, scope, secret-scan, blocklist, rate-limit on every tool call"
  homepage "https://systemprompt.io"
  license "MIT"
  version "0.23.0"

  on_macos do
    url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.23.0/systemprompt-gateway-0.23.0-darwin-arm64.tar.gz"
    sha256 "86002a6c1594bd55bd2351368ea0225b713c563dc5c701866f11b9443903c5ac"
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.23.0/systemprompt-gateway-0.23.0-linux-amd64.tar.gz"
      sha256 "81676c8d471221e0254547437fec0f411698f2ecfabc0c9999f773dbf8d45319"
    end
    on_arm do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.23.0/systemprompt-gateway-0.23.0-linux-arm64.tar.gz"
      sha256 "6bf76b2e8a32bbb30d40c2d1d9d9ec9556491bb8acb90cb79e6ce17a84c2ff32"
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
