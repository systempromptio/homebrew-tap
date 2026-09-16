class Bridge < Formula
  desc "systemprompt bridge — client-side agent for the systemprompt AI governance gateway"
  homepage "https://systemprompt.io"
  license "MIT AND BUSL-1.1"
  version "0.53.0"

  on_macos do
    on_arm do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.53.0/systemprompt-bridge-aarch64-apple-darwin"
      sha256 "d061fbbb739c5e896bd141b116da7bb2439ed62583ba2f172bc36e873ab79e76"

      def install
        bin.install "systemprompt-bridge-aarch64-apple-darwin" => "systemprompt-bridge"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.53.0/systemprompt-bridge-x86_64-unknown-linux-gnu"
      sha256 "02e2bcea92d7a64af41b7c513233eb3c7b6cb362933823e49c20d96cd3d68697"

      def install
        bin.install "systemprompt-bridge-x86_64-unknown-linux-gnu" => "systemprompt-bridge"
      end
    end
  end

  test do
    system "#{bin}/systemprompt-bridge", "--version"
  end
end
