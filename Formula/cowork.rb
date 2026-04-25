class Cowork < Formula
  desc "Cowork — client-side CLI for the systemprompt AI governance gateway"
  homepage "https://systemprompt.io"
  license "MIT"
  version "0.4.0"
  url "https://github.com/systempromptio/systemprompt-template/releases/download/cowork-v0.4.0/systemprompt-cowork-aarch64-apple-darwin"
  sha256 "6eb690ea5c860f874d7e75604375e6442e1ea6f5a28ef1811dc91fb974e9e87d"

  def install
    bin.install "systemprompt-cowork-aarch64-apple-darwin" => "cowork"
  end

  test do
    system "#{bin}/cowork", "--version"
  end
end
