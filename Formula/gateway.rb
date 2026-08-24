class Gateway < Formula
  desc "Self-hosted AI governance gateway — JWT, scope, secret-scan, blocklist, rate-limit on every tool call"
  homepage "https://systemprompt.io"
  license "MIT"
  version "0.37.1"

  on_macos do
    url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.37.1/systemprompt-gateway-0.37.1-darwin-arm64.tar.gz"
    sha256 "0332a88f1315d06a2563bc612bc7709f9bfcd4e903fef1df3632d620eb04d6c4"
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.37.1/systemprompt-gateway-0.37.1-linux-amd64.tar.gz"
      sha256 "56c2deeae66a22ef065ae18a133e04c0b1d56b3a2f88bb48f08abd07d2bf9e92"
    end
    on_arm do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.37.1/systemprompt-gateway-0.37.1-linux-arm64.tar.gz"
      sha256 "10baf7be2310665396104b01892efd9fb3631bbe62cdabfa92c85b5cb2240762"
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
