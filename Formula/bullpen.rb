class Bullpen < Formula
  desc "CLI for Bullpen prediction markets"
  homepage "https://bullpen.fi"
  version "0.1.32"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BullpenFi/bullpen-cli-releases/releases/download/v#{version}/bullpen-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "aed83ea54ccddb5d0b6dedf1c36a42b7d994274c2acbdc34998773aefacb43bd"
    else
      url "https://github.com/BullpenFi/bullpen-cli-releases/releases/download/v#{version}/bullpen-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "3b33e804ab84450b51af5ca617e312b16ce6ed1978b1ca657257f19bf1bce612"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BullpenFi/bullpen-cli-releases/releases/download/v#{version}/bullpen-#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9e0acb23b55ce487d1a4f8dce1bf27040bf2ad5b7092250c09011ed22337a2d4"
    else
      url "https://github.com/BullpenFi/bullpen-cli-releases/releases/download/v#{version}/bullpen-#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7d67aa3bbeecc3685665426b4bcc166089371423ca50b64ebacee089334f26ae"
    end
  end

  def install
    bin.install "bullpen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bullpen --version")
  end
end
