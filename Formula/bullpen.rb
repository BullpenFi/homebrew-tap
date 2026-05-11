class Bullpen < Formula
  desc "CLI for Bullpen prediction markets"
  homepage "https://bullpen.fi"
  version "0.1.88"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BullpenFi/bullpen-cli-releases/releases/download/v#{version}/bullpen-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "de135877ee876eccb89bec98831718d2334db4218f439092bf49f3ed3ea23340"
    else
      url "https://github.com/BullpenFi/bullpen-cli-releases/releases/download/v#{version}/bullpen-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "10de309d0ffdee34c40b2a6c1b0fe7cd57940a5e33c554f2c2d62f3c4117c6f8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BullpenFi/bullpen-cli-releases/releases/download/v#{version}/bullpen-#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6ea72a2a6d74ab7e55cef4b30f4ab12162bc57bd0d0e759e1c6e4f1cc3b25045"
    else
      url "https://github.com/BullpenFi/bullpen-cli-releases/releases/download/v#{version}/bullpen-#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1b57dd26def8f1c2639d81706b647a7e2c648c652b9efa951d81a189214c7842"
    end
  end

  def install
    bin.install "bullpen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bullpen --version")
  end
end
