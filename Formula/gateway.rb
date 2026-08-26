class Gateway < Formula
  desc "Self-hosted AI governance gateway — JWT, scope, secret-scan, blocklist, rate-limit on every tool call"
  homepage "https://systemprompt.io"
  license "MIT"
  version "0.40.0"

  on_macos do
    url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.40.0/systemprompt-gateway-0.40.0-darwin-arm64.tar.gz"
    sha256 "a85cc71158fec51cf8522f265cd6ea4f59d27f43b28320667040c65c6cc7aa00"
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.40.0/systemprompt-gateway-0.40.0-linux-amd64.tar.gz"
      sha256 "030c6eb64bb6514238836f966ddf936dbbebc41b316c1689e81239b5c4d084ae"
    end
    on_arm do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.40.0/systemprompt-gateway-0.40.0-linux-arm64.tar.gz"
      sha256 "21584936cd6357c2f57983a8df373266730ec596a3965d0b1393f695e26dbe84"
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
