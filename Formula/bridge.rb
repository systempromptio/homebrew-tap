class Bridge < Formula
  desc "systemprompt bridge — client-side agent for the systemprompt AI governance gateway"
  homepage "https://systemprompt.io"
  license "MIT AND BUSL-1.1"
  version "0.9.0"

  on_macos do
    on_arm do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.9.0/systemprompt-bridge-aarch64-apple-darwin"
      sha256 "3b656b8beb4f0351646edd4a6241c1f3abc150a5098fac851052bb074a5a3aba"

      def install
        bin.install "systemprompt-bridge-aarch64-apple-darwin" => "systemprompt-bridge"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.9.0/systemprompt-bridge-x86_64-unknown-linux-gnu"
      sha256 "53e977bd5827a80c39c01ce3d0741c527336ab71be2795e95a9c1942a4e286ef"

      def install
        bin.install "systemprompt-bridge-x86_64-unknown-linux-gnu" => "systemprompt-bridge"
      end
    end
  end

  test do
    system "#{bin}/systemprompt-bridge", "--version"
  end
end
