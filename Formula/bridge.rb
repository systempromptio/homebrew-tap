class Bridge < Formula
  desc "systemprompt bridge — client-side agent for the systemprompt AI governance gateway"
  homepage "https://systemprompt.io"
  license "MIT AND BUSL-1.1"
  version "0.56.1"

  on_macos do
    on_arm do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.56.1/systemprompt-bridge-aarch64-apple-darwin"
      sha256 "8d48009c5c78f00d3958c50bf819855536c20d67546d77130891ae27999ca936"

      def install
        bin.install "systemprompt-bridge-aarch64-apple-darwin" => "systemprompt-bridge"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.56.1/systemprompt-bridge-x86_64-unknown-linux-gnu"
      sha256 "4555aa94c3cc28d0ac41f27a048dcc5ec51d861373c0c657968209d55c09fd20"

      def install
        bin.install "systemprompt-bridge-x86_64-unknown-linux-gnu" => "systemprompt-bridge"
      end
    end
  end

  test do
    system "#{bin}/systemprompt-bridge", "--version"
  end
end
