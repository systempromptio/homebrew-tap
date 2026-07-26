class Gateway < Formula
  desc "Self-hosted AI governance gateway — JWT, scope, secret-scan, blocklist, rate-limit on every tool call"
  homepage "https://systemprompt.io"
  license "MIT"
  version "0.24.0"

  on_macos do
    url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.24.0/systemprompt-gateway-0.24.0-darwin-arm64.tar.gz"
    sha256 "71779b480d490ea8a932a672260b7b791c232604b29d273515d402b33cae6136"
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.24.0/systemprompt-gateway-0.24.0-linux-amd64.tar.gz"
      sha256 "e469dc16991d6386929507619657299771f8d5253fc7fbdbc39d62c046e38e96"
    end
    on_arm do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.24.0/systemprompt-gateway-0.24.0-linux-arm64.tar.gz"
      sha256 "c3b3158a37b53ac9fa7b6b8f3d70015a5cc96360617d258cf1b50f7d786e3d75"
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
