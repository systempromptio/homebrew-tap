class Gateway < Formula
  desc "Self-hosted AI governance gateway — JWT, scope, secret-scan, blocklist, rate-limit on every tool call"
  homepage "https://systemprompt.io"
  license "MIT"
  version "0.32.2"

  on_macos do
    url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.32.2/systemprompt-gateway-0.32.2-darwin-arm64.tar.gz"
    sha256 "323e3303cb69d83ce75db752afcd40a3b38c7e92069bef6c38f36b13c5f56ee1"
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.32.2/systemprompt-gateway-0.32.2-linux-amd64.tar.gz"
      sha256 "1b4c7f302fba8da5e7765cd730b69840894940453896bdede7ac339da6c16c53"
    end
    on_arm do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.32.2/systemprompt-gateway-0.32.2-linux-arm64.tar.gz"
      sha256 "e1c7598ce533b0baf55fd23a7c49fc7e64822bffa721a3bc29aa5b78301016e4"
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
