class Bridge < Formula
  desc "systemprompt bridge — client-side agent for the systemprompt AI governance gateway"
  homepage "https://systemprompt.io"
  license "MIT AND BUSL-1.1"
  version "0.52.0"

  on_macos do
    on_arm do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.52.0/systemprompt-bridge-aarch64-apple-darwin"
      sha256 "d6788fd6b1bc13d41ee2a999b7017e4c7040ab68c330cf30ef4d0e5f6503a356"

      def install
        bin.install "systemprompt-bridge-aarch64-apple-darwin" => "systemprompt-bridge"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.52.0/systemprompt-bridge-x86_64-unknown-linux-gnu"
      sha256 "74af3475c6339faf1eb57ba1af2a389edbc22e6dc50cfbc65538bb587b17e74e"

      def install
        bin.install "systemprompt-bridge-x86_64-unknown-linux-gnu" => "systemprompt-bridge"
      end
    end
  end

  test do
    system "#{bin}/systemprompt-bridge", "--version"
  end
end
