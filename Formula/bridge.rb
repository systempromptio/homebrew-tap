class Bridge < Formula
  desc "systemprompt bridge — client-side agent for the systemprompt AI governance gateway"
  homepage "https://systemprompt.io"
  license "MIT AND BUSL-1.1"
  version "0.55.0"

  on_macos do
    on_arm do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.55.0/systemprompt-bridge-aarch64-apple-darwin"
      sha256 "f2948cc050f583325ac8cdbedd9d8dc11c0e3e4b67f86d53ce568e5898587df5"

      def install
        bin.install "systemprompt-bridge-aarch64-apple-darwin" => "systemprompt-bridge"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/systempromptio/systemprompt-core/releases/download/bridge-v0.55.0/systemprompt-bridge-x86_64-unknown-linux-gnu"
      sha256 "8c1c7431edb7144ae96a7717fc26990f2eb46d1d5a0537ad4097583f683b1c89"

      def install
        bin.install "systemprompt-bridge-x86_64-unknown-linux-gnu" => "systemprompt-bridge"
      end
    end
  end

  test do
    system "#{bin}/systemprompt-bridge", "--version"
  end
end
