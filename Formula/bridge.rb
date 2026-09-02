class Bridge < Formula
  desc "systemprompt bridge — client-side agent for the systemprompt AI governance gateway"
  homepage "https://systemprompt.io"
  license "MIT AND BUSL-1.1"
  version "0.35.0"

  on_macos do
    on_arm do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.35.0/systemprompt-bridge-aarch64-apple-darwin"
      sha256 "12dc305e61edd52cfe186fbdd0e9a55fc163bdcb3ae6cdfdd575fb0d51010ad1"

      def install
        bin.install "systemprompt-bridge-aarch64-apple-darwin" => "systemprompt-bridge"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.35.0/systemprompt-bridge-x86_64-unknown-linux-gnu"
      sha256 "05bea10fb2de3bb90b5163a34c9d5a9eaaf3ca74f945bc33ccf9f1f4cd844808"

      def install
        bin.install "systemprompt-bridge-x86_64-unknown-linux-gnu" => "systemprompt-bridge"
      end
    end
  end

  test do
    system "#{bin}/systemprompt-bridge", "--version"
  end
end
