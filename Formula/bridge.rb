class Bridge < Formula
  desc "systemprompt bridge — client-side agent for the systemprompt AI governance gateway"
  homepage "https://systemprompt.io"
  license "MIT AND BUSL-1.1"
  version "0.57.0"

  on_macos do
    on_arm do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.57.0/systemprompt-bridge-aarch64-apple-darwin"
      sha256 "123e3a1c9b97d88be10be28e39aabe73fcabb2386f6d58ab64b09973e78a5454"

      def install
        bin.install "systemprompt-bridge-aarch64-apple-darwin" => "systemprompt-bridge"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.57.0/systemprompt-bridge-x86_64-unknown-linux-gnu"
      sha256 "3c38fd98c7c43072b04cced0a04b91f462244f70de819fb6191b55f2e76cd7ef"

      def install
        bin.install "systemprompt-bridge-x86_64-unknown-linux-gnu" => "systemprompt-bridge"
      end
    end
  end

  test do
    system "#{bin}/systemprompt-bridge", "--version"
  end
end
