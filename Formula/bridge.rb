class Bridge < Formula
  desc "systemprompt bridge — client-side agent for the systemprompt AI governance gateway"
  homepage "https://systemprompt.io"
  license "MIT AND BUSL-1.1"
  version "0.50.0"

  on_macos do
    on_arm do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.50.0/systemprompt-bridge-aarch64-apple-darwin"
      sha256 "e91075efc6d74db033c159a9a35ba7d50a139cd4ba142db5364e10ecc9373ec0"

      def install
        bin.install "systemprompt-bridge-aarch64-apple-darwin" => "systemprompt-bridge"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.50.0/systemprompt-bridge-x86_64-unknown-linux-gnu"
      sha256 "4bbecf03f4ec19bc6df4473388a8e570b0cd175eecbbd69346529f2da63ddcf4"

      def install
        bin.install "systemprompt-bridge-x86_64-unknown-linux-gnu" => "systemprompt-bridge"
      end
    end
  end

  test do
    system "#{bin}/systemprompt-bridge", "--version"
  end
end
