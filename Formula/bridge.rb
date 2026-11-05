class Bridge < Formula
  desc "systemprompt bridge — client-side agent for the systemprompt AI governance gateway"
  homepage "https://systemprompt.io"
  license "MIT AND BUSL-1.1"
  version "0.79.0"

  on_macos do
    on_arm do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.79.0/systemprompt-bridge-aarch64-apple-darwin"
      sha256 "d53171e9af34f076567c1bab837702f6b2153b193cefb1d8d3efe86dca8a249c"

      def install
        bin.install "systemprompt-bridge-aarch64-apple-darwin" => "systemprompt-bridge"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.79.0/systemprompt-bridge-x86_64-unknown-linux-gnu"
      sha256 "e3fc3ecf38ed29cd9e9a97f2c638039c1cb153a58291eec24cad7e7a44489354"

      def install
        bin.install "systemprompt-bridge-x86_64-unknown-linux-gnu" => "systemprompt-bridge"
      end
    end
  end

  test do
    system "#{bin}/systemprompt-bridge", "--version"
  end
end
