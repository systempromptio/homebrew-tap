class Gateway < Formula
  desc "Self-hosted AI governance gateway — JWT, scope, secret-scan, blocklist, rate-limit on every tool call"
  homepage "https://systemprompt.io"
  license "MIT"
  version "0.42.0"

  on_macos do
    url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.42.0/systemprompt-gateway-0.42.0-darwin-arm64.tar.gz"
    sha256 "772adb2253f83efda89e99c33ad309daffb1de94eb74dd95e2cd6c33d3f323a3"
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.42.0/systemprompt-gateway-0.42.0-linux-amd64.tar.gz"
      sha256 "b6bd49f5c8b8d10ce6d841d4e1569bbc24d8beaf7d683d65cd7d1b382b1a4ed9"
    end
    on_arm do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.42.0/systemprompt-gateway-0.42.0-linux-arm64.tar.gz"
      sha256 "f2c0e6cebb1eebe835eb2f3225ad5bbb34a9ac4b0068556142d5c9559d031795"
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
