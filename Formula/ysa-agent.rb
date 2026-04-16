class YsaAgent < Formula
  desc "Agent daemon for ysa.run — runs issues in sandboxed containers"
  homepage "https://ysa.run"
  version "0.1.18"

  on_macos do
    on_arm do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.18/ysa-agent-darwin-arm64"
      sha256 "19ad985c5fef49202afaaa69a0cb0c2c0bcf1312de34c30eeed9b0296bc2518d"
    end
    on_intel do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.18/ysa-agent-darwin-x64"
      sha256 "6499d4fa0884b5a202f8945c06932debbce3b7973eaa928f35c272fd66495b1a"
    end
  end

  def install
    binary = Hardware::CPU.arm? ? "ysa-agent-darwin-arm64" : "ysa-agent-darwin-x64"
    bin.install binary => "ysa-agent"
  end

  test do
    system "#{bin}/ysa-agent", "--version"
  end
end
