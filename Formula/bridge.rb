class Bridge < Formula
  desc "systemprompt bridge — client-side agent for the systemprompt AI governance gateway"
  homepage "https://systemprompt.io"
  license "MIT AND BUSL-1.1"
  version "0.17.0"

  on_macos do
    on_arm do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.17.0/systemprompt-bridge-aarch64-apple-darwin"
      sha256 "bf0c2b9e32a4aa585e056471815487b03b9e0ef7af7626bed3cf6045a4168570"

      def install
        bin.install "systemprompt-bridge-aarch64-apple-darwin" => "systemprompt-bridge"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.17.0/systemprompt-bridge-x86_64-unknown-linux-gnu"
      sha256 "09e2150d00489c8ebddbde45036471d63d127e43127e17c386ec06b5c4f1adbc"

      def install
        bin.install "systemprompt-bridge-x86_64-unknown-linux-gnu" => "systemprompt-bridge"
      end
    end
  end

  test do
    system "#{bin}/systemprompt-bridge", "--version"
  end
end
