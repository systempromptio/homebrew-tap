class Gateway < Formula
  desc "Self-hosted AI governance gateway — JWT, scope, secret-scan, blocklist, rate-limit on every tool call"
  homepage "https://systemprompt.io"
  license "MIT"
  version "0.36.0"

  on_macos do
    url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.36.0/systemprompt-gateway-0.36.0-darwin-arm64.tar.gz"
    sha256 "4af869da24e99e3a9b971b62c640bb8a035cdd1b5bb0471037c7be77eaebcd8b"
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.36.0/systemprompt-gateway-0.36.0-linux-amd64.tar.gz"
      sha256 "6a47967aef68526dea2cbcd8ee06011af6592a67921c4587c21f3ee4b05c2546"
    end
    on_arm do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.36.0/systemprompt-gateway-0.36.0-linux-arm64.tar.gz"
      sha256 "1bd66fd340ff47a3d359f9d2005af95ee39961cba37951848a231537d1f1c2d1"
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
