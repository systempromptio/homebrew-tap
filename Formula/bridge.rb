class Bridge < Formula
  desc "systemprompt bridge — client-side agent for the systemprompt AI governance gateway"
  homepage "https://systemprompt.io"
  license "MIT AND BUSL-1.1"
  version "0.51.0"

  on_macos do
    on_arm do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.51.0/systemprompt-bridge-aarch64-apple-darwin"
      sha256 "6d7200f09b00367858e2a5b5d01d06a0c911166e5cc1e3b0277710c4e4b024d6"

      def install
        bin.install "systemprompt-bridge-aarch64-apple-darwin" => "systemprompt-bridge"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.51.0/systemprompt-bridge-x86_64-unknown-linux-gnu"
      sha256 "1138898f5bf73ee9d91cfd322e1701141b43137aeac8a3e1b8410c21011e5208"

      def install
        bin.install "systemprompt-bridge-x86_64-unknown-linux-gnu" => "systemprompt-bridge"
      end
    end
  end

  test do
    system "#{bin}/systemprompt-bridge", "--version"
  end
end
