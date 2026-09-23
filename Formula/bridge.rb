class Bridge < Formula
  desc "systemprompt bridge — client-side agent for the systemprompt AI governance gateway"
  homepage "https://systemprompt.io"
  license "MIT AND BUSL-1.1"
  version "0.60.0"

  on_macos do
    on_arm do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.60.0/systemprompt-bridge-aarch64-apple-darwin"
      sha256 "fdc0e531cafec831b22617af4d2cd956dedf13304ad75e577cc2c774141cb2d4"

      def install
        bin.install "systemprompt-bridge-aarch64-apple-darwin" => "systemprompt-bridge"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.60.0/systemprompt-bridge-x86_64-unknown-linux-gnu"
      sha256 "6f78e9d06a476f776f0dfd4c38097dde77cf9501aec1c33318dbb39f016c86aa"

      def install
        bin.install "systemprompt-bridge-x86_64-unknown-linux-gnu" => "systemprompt-bridge"
      end
    end
  end

  test do
    system "#{bin}/systemprompt-bridge", "--version"
  end
end
