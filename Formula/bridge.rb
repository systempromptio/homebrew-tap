class Bridge < Formula
  desc "systemprompt bridge — client-side agent for the systemprompt AI governance gateway"
  homepage "https://systemprompt.io"
  license "MIT AND BUSL-1.1"
  version "0.79.1"

  on_macos do
    on_arm do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.79.1/systemprompt-bridge-aarch64-apple-darwin"
      sha256 "22230133f9d9a266c9151096e2dc97b2cb0a038e622f3b115ca9310aa645f0d4"

      def install
        bin.install "systemprompt-bridge-aarch64-apple-darwin" => "systemprompt-bridge"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.79.1/systemprompt-bridge-x86_64-unknown-linux-gnu"
      sha256 "51a52bfe60c430dc4e9f8e766d17417696f066732bb33873a4659fecb33d11e7"

      def install
        bin.install "systemprompt-bridge-x86_64-unknown-linux-gnu" => "systemprompt-bridge"
      end
    end
  end

  test do
    system "#{bin}/systemprompt-bridge", "--version"
  end
end
