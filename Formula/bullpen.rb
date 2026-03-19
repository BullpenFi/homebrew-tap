class Bullpen < Formula
  desc "CLI for Bullpen prediction markets"
  homepage "https://bullpen.fi"
  version "0.1.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BullpenFi/bullpen-cli-releases/releases/download/v#{version}/bullpen-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "ceab1749e8f9d510117f1ab0c1c5aac84eee26c02e6d6205790a495014db8bff"
    else
      url "https://github.com/BullpenFi/bullpen-cli-releases/releases/download/v#{version}/bullpen-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "edd30118c18909424e8472f8a0d82d9fd362f631c24483588c1ba7e6f7abb133"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BullpenFi/bullpen-cli-releases/releases/download/v#{version}/bullpen-#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "73c8ad2068e8a887c276bbdcc98d0b539b369150c32d5ea1f4ed084e2071fe32"
    else
      url "https://github.com/BullpenFi/bullpen-cli-releases/releases/download/v#{version}/bullpen-#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1310cf4f4131894574f72f8d8fec910245a8fc51affad3b8c31b3474d2c3930b"
    end
  end

  def install
    bin.install "bullpen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bullpen --version")
  end
end
