class Bridge < Formula
  desc "systemprompt bridge — client-side agent for the systemprompt AI governance gateway"
  homepage "https://systemprompt.io"
  license "MIT AND BUSL-1.1"
  version "0.25.0"

  on_macos do
    on_arm do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.25.0/systemprompt-bridge-aarch64-apple-darwin"
      sha256 "bf055b52d608d76ed9b7d6195bfc4a7f9e43cf68c906b93ae25fe736171f574b"

      def install
        bin.install "systemprompt-bridge-aarch64-apple-darwin" => "systemprompt-bridge"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.25.0/systemprompt-bridge-x86_64-unknown-linux-gnu"
      sha256 "56886bd18dfcd0503ace4c2bbf5616f8a8cda6c8766368f77ed986efdc800f82"

      def install
        bin.install "systemprompt-bridge-x86_64-unknown-linux-gnu" => "systemprompt-bridge"
      end
    end
  end

  test do
    system "#{bin}/systemprompt-bridge", "--version"
  end
end
