class Gateway < Formula
  desc "Self-hosted AI governance gateway — JWT, scope, secret-scan, blocklist, rate-limit on every tool call"
  homepage "https://systemprompt.io"
  license "MIT"
  version "0.5.0"

  on_macos do
    url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.5.0/systemprompt-gateway-0.5.0-darwin-arm64.tar.gz"
    sha256 "3a4a4daf85f2f81ce5676e1f7a472f0337c6cbdac0a3fc1bbfd9fc4069683be6"
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.5.0/systemprompt-gateway-0.5.0-linux-amd64.tar.gz"
      sha256 "a4ac8cde1d8934aaa374582b44fb4f57cc93c8e6a5e4f07f66848b8da0f48e1a"
    end
    on_arm do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.5.0/systemprompt-gateway-0.5.0-linux-arm64.tar.gz"
      sha256 "9752de332e70d89ae29036c7158f8fed1622f14a760d6c0054b9bf41bc71c926"
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
