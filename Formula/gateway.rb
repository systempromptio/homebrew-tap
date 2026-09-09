class Gateway < Formula
  desc "Self-hosted AI governance gateway — JWT, scope, secret-scan, blocklist, rate-limit on every tool call"
  homepage "https://systemprompt.io"
  license "MIT"
  version "0.49.0"

  on_macos do
    url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.49.0/systemprompt-gateway-0.49.0-darwin-arm64.tar.gz"
    sha256 "d2cd298565cfd5bbd6c573da86260ad9b38a58a867e28325210bcb36e0be9037"
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.49.0/systemprompt-gateway-0.49.0-linux-amd64.tar.gz"
      sha256 "fa4a5a778527a2c5ecf0313e6c1a271c5464fc079ab8dfd61bcfbb3030a2871a"
    end
    on_arm do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.49.0/systemprompt-gateway-0.49.0-linux-arm64.tar.gz"
      sha256 "359fe61a97610b7c40feb6d91a2dd18658b990c553e2b26d18fcfd745ef55afe"
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
