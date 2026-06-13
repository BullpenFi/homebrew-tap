class Bullpen < Formula
  desc "CLI for Bullpen prediction markets"
  homepage "https://bullpen.fi"
  version "0.1.103"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BullpenFi/bullpen-cli-releases/releases/download/v#{version}/bullpen-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "d2491f3abef80a44b7894b0de352683057753265b352be7b414d0b0262e7c28c"
    else
      url "https://github.com/BullpenFi/bullpen-cli-releases/releases/download/v#{version}/bullpen-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "52daa31e7e44c22c43642a7922e08f3008bbc0df7caa0b8adee86148ea174e42"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BullpenFi/bullpen-cli-releases/releases/download/v#{version}/bullpen-#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3aa068cde36d17252947b04fd6a5c8e8ca73b9c2f3e77eb9ff56cac305cb5930"
    else
      url "https://github.com/BullpenFi/bullpen-cli-releases/releases/download/v#{version}/bullpen-#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b04359503f941ca13ec44f96264258aa3a2ee6aaedbcf7a0df80969a8984e000"
    end
  end

  def install
    bin.install "bullpen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bullpen --version")
  end
end
