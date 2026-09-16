class Bridge < Formula
  desc "systemprompt bridge — client-side agent for the systemprompt AI governance gateway"
  homepage "https://systemprompt.io"
  license "MIT AND BUSL-1.1"
  version "0.54.0"

  on_macos do
    on_arm do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.54.0/systemprompt-bridge-aarch64-apple-darwin"
      sha256 "cc496af4e065f0b2b668447dc3fb5ce24cd4c02b2463ff3f710cc021ca4ecbe6"

      def install
        bin.install "systemprompt-bridge-aarch64-apple-darwin" => "systemprompt-bridge"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.54.0/systemprompt-bridge-x86_64-unknown-linux-gnu"
      sha256 "ad55cb7554aee4cc6ae6d28f1048cd330f00279bc9144f64cf3ee512b19d083b"

      def install
        bin.install "systemprompt-bridge-x86_64-unknown-linux-gnu" => "systemprompt-bridge"
      end
    end
  end

  test do
    system "#{bin}/systemprompt-bridge", "--version"
  end
end
