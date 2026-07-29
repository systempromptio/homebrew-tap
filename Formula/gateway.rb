class Gateway < Formula
  desc "Self-hosted AI governance gateway — JWT, scope, secret-scan, blocklist, rate-limit on every tool call"
  homepage "https://systemprompt.io"
  license "MIT"
  version "0.27.0"

  on_macos do
    url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.27.0/systemprompt-gateway-0.27.0-darwin-arm64.tar.gz"
    sha256 "a5a9d8618e0c70032b83bd44cac3da054e5fbafe8a971b1b4e3ba93f01459a58"
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.27.0/systemprompt-gateway-0.27.0-linux-amd64.tar.gz"
      sha256 "b64205869cea67f176ace6a3f5a485c318214c77eb63026094d0f307f278073b"
    end
    on_arm do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.27.0/systemprompt-gateway-0.27.0-linux-arm64.tar.gz"
      sha256 "6eeabaefdbcea7a3e9347a45a7958f718a9f23d6ad6518491f6ee281f682a5ad"
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
