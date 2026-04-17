class YsaAgent < Formula
  desc "Agent daemon for ysa.run — runs issues in sandboxed containers"
  homepage "https://ysa.run"
  version "0.1.19"

  on_macos do
    on_arm do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.19/ysa-agent-darwin-arm64"
      sha256 "d79a0c284af14aff678d9aa778fd31e87964a699d153db17be87b1cf2e6e05b4"
    end
    on_intel do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.19/ysa-agent-darwin-x64"
      sha256 "040a5e52051ca1d0f01c10a85ba7273233ceb00348a49e1be2a19ffa2c71dccb"
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
