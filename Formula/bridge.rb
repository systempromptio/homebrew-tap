class Bridge < Formula
  desc "systemprompt bridge — client-side agent for the systemprompt AI governance gateway"
  homepage "https://systemprompt.io"
  license "MIT AND BUSL-1.1"
  version "0.61.0"

  on_macos do
    on_arm do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.61.0/systemprompt-bridge-aarch64-apple-darwin"
      sha256 "7d2df712d7fe8e9afca38567f9e259e950c6501ed43d9f8519da06b3b383742b"

      def install
        bin.install "systemprompt-bridge-aarch64-apple-darwin" => "systemprompt-bridge"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.61.0/systemprompt-bridge-x86_64-unknown-linux-gnu"
      sha256 "4b981b499be246d28c54b9f56b0437ac7177ab5c6935b4da83f379eb47f10d82"

      def install
        bin.install "systemprompt-bridge-x86_64-unknown-linux-gnu" => "systemprompt-bridge"
      end
    end
  end

  test do
    system "#{bin}/systemprompt-bridge", "--version"
  end
end
