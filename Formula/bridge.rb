class Bridge < Formula
  desc "systemprompt bridge — client-side agent for the systemprompt AI governance gateway"
  homepage "https://systemprompt.io"
  license "MIT AND BUSL-1.1"
  version "0.37.0"

  on_macos do
    on_arm do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.37.0/systemprompt-bridge-aarch64-apple-darwin"
      sha256 "7dac8c71d308265ee9b92ae9d458b931e157b2ea286ebe4725c2f6a9d62f1b57"

      def install
        bin.install "systemprompt-bridge-aarch64-apple-darwin" => "systemprompt-bridge"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.37.0/systemprompt-bridge-x86_64-unknown-linux-gnu"
      sha256 "bedf698832d892bb28a62728458be7cf0af591366afe4e8150c293fd646f2f21"

      def install
        bin.install "systemprompt-bridge-x86_64-unknown-linux-gnu" => "systemprompt-bridge"
      end
    end
  end

  test do
    system "#{bin}/systemprompt-bridge", "--version"
  end
end
