class Gateway < Formula
  desc "Self-hosted AI governance gateway — JWT, scope, secret-scan, blocklist, rate-limit on every tool call"
  homepage "https://systemprompt.io"
  license "MIT"
  version "0.37.0"

  on_macos do
    url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.37.0/systemprompt-gateway-0.37.0-darwin-arm64.tar.gz"
    sha256 "ca0f86c2a5334671a26de9b24be994086e81c9d98ac3be481eac17df7eaba237"
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.37.0/systemprompt-gateway-0.37.0-linux-amd64.tar.gz"
      sha256 "3d3f567f8684248c227d0294024c9a9693e559c5c7082ccfe76dce8e08717537"
    end
    on_arm do
      url "https://github.com/systempromptio/systemprompt-template/releases/download/v0.37.0/systemprompt-gateway-0.37.0-linux-arm64.tar.gz"
      sha256 "aac4e3acde337c01b65181eb3ee6c320734204caebc49e2def125342a26a4407"
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
