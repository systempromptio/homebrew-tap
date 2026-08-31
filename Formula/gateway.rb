class Gateway < Formula
  desc "Self-hosted AI governance gateway — JWT, scope, secret-scan, blocklist, rate-limit on every tool call"
  homepage "https://systemprompt.io"
  license "MIT"
  version "0.42.1"

  on_macos do
    url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.42.1/systemprompt-gateway-0.42.1-darwin-arm64.tar.gz"
    sha256 "04e8a6b62e439635d5ac8a63a9e44e3f65c89f9790a70c257f11be09c3142abb"
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.42.1/systemprompt-gateway-0.42.1-linux-amd64.tar.gz"
      sha256 "aa02ae45deb1da3c3a94c791df033473d593feeb979adce16ab5eab1568c6006"
    end
    on_arm do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.42.1/systemprompt-gateway-0.42.1-linux-arm64.tar.gz"
      sha256 "7b2142b224bea09c389a2d1e698c735373840b7be249ff260bcad87b30de68df"
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
