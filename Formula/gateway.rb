class Gateway < Formula
  desc "Self-hosted AI governance gateway — JWT, scope, secret-scan, blocklist, rate-limit on every tool call"
  homepage "https://systemprompt.io"
  license "MIT"
  version "0.26.0"

  on_macos do
    url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.26.0/systemprompt-gateway-0.26.0-darwin-arm64.tar.gz"
    sha256 "c536c4c80aa8f5645af74b6f7888e9dcce348192f443a19d1372cd6a6f439e74"
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.26.0/systemprompt-gateway-0.26.0-linux-amd64.tar.gz"
      sha256 "ca81258615579ed5d98b9d6801d1e9a129b1d05f002504e5e0abbf6d49cd2dfa"
    end
    on_arm do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.26.0/systemprompt-gateway-0.26.0-linux-arm64.tar.gz"
      sha256 "004707b5dbaf4a2b8ac86cca4d269a50bb38fda3208ef85d51072f985f1f4f18"
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
