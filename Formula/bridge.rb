class Bridge < Formula
  desc "systemprompt bridge — client-side agent for the systemprompt AI governance gateway"
  homepage "https://systemprompt.io"
  license "MIT AND BUSL-1.1"
  version "0.81.0"

  on_macos do
    on_arm do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.81.0/systemprompt-bridge-aarch64-apple-darwin"
      sha256 "eeb1ae9292d794f33501790ccc02f0367630346342f66ec3caddbb8f857999fc"

      def install
        bin.install "systemprompt-bridge-aarch64-apple-darwin" => "systemprompt-bridge"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.81.0/systemprompt-bridge-x86_64-unknown-linux-gnu"
      sha256 "252035b40350a6c907092210f7fb9e1e63124b01269a9e67bdf8e1ff71503e14"

      def install
        bin.install "systemprompt-bridge-x86_64-unknown-linux-gnu" => "systemprompt-bridge"
      end
    end
  end

  test do
    system "#{bin}/systemprompt-bridge", "--version"
  end
end
