class Gateway < Formula
  desc "Self-hosted AI governance gateway — JWT, scope, secret-scan, blocklist, rate-limit on every tool call"
  homepage "https://systemprompt.io"
  license "MIT"
  version "0.25.0"

  on_macos do
    url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.25.0/systemprompt-gateway-0.25.0-darwin-arm64.tar.gz"
    sha256 "3f3a9bacbb57378c98eb356aef3986a59e525277371f4d0bb925798e9f07fe15"
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.25.0/systemprompt-gateway-0.25.0-linux-amd64.tar.gz"
      sha256 "a1ecb8cec2979c83d6a1c536adcf06df17a58afdbe72ed3c284fb89a43b9a3bf"
    end
    on_arm do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.25.0/systemprompt-gateway-0.25.0-linux-arm64.tar.gz"
      sha256 "91ae02ec1210565d8ebff34b51d7ea30286f401c41abdf32595721dde882e510"
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
