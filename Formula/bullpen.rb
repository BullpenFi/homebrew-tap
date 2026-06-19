class Bullpen < Formula
  desc "CLI for Bullpen prediction markets"
  homepage "https://bullpen.fi"
  version "0.1.106"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BullpenFi/bullpen-cli-releases/releases/download/v#{version}/bullpen-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "50220ce56b1f91e303ebbc086b7f642f4b3ec98d5d4ec00ad2ee42898f57b9dc"
    else
      url "https://github.com/BullpenFi/bullpen-cli-releases/releases/download/v#{version}/bullpen-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "2f98f046e1732564a494daecdcb0b0aa67407716fa4c9b4581f76185c5aab96f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BullpenFi/bullpen-cli-releases/releases/download/v#{version}/bullpen-#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9ef8a1ff11f0e7b3e0b850de89e7f4a57f888427de776ad4945658683331a353"
    else
      url "https://github.com/BullpenFi/bullpen-cli-releases/releases/download/v#{version}/bullpen-#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bee03e707d4af6b58516fa0d70ef286c763630ab279c728b9c348b4e9ee51de8"
    end
  end

  def install
    bin.install "bullpen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bullpen --version")
  end
end
