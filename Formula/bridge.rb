class Bridge < Formula
  desc "systemprompt bridge — client-side agent for the systemprompt AI governance gateway"
  homepage "https://systemprompt.io"
  license "MIT AND BUSL-1.1"
  version "0.81.1"

  on_macos do
    on_arm do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.81.1/systemprompt-bridge-aarch64-apple-darwin"
      sha256 "23f97b4eb9215245715c28c4fe30dccbfa39f8909168be81ab70c08b24f4e99c"

      def install
        bin.install "systemprompt-bridge-aarch64-apple-darwin" => "systemprompt-bridge"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.81.1/systemprompt-bridge-x86_64-unknown-linux-gnu"
      sha256 "f5f03b96b74b193d7ec53abb9aa0578a64a252b513cc3600f0e65e2988023f5e"

      def install
        bin.install "systemprompt-bridge-x86_64-unknown-linux-gnu" => "systemprompt-bridge"
      end
    end
  end

  test do
    system "#{bin}/systemprompt-bridge", "--version"
  end
end
