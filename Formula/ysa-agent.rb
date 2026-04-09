class YsaAgent < Formula
  desc "Agent daemon for ysa.run — runs issues in sandboxed containers"
  homepage "https://ysa.run"
  version "0.1.3"

  on_macos do
    on_arm do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.3/ysa-agent-darwin-arm64"
      sha256 "9ae77deec647052ddd5d2c5be426957b5640ace26ef8954f9193be70ab8bf5a9"
    end
    on_intel do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.3/ysa-agent-darwin-x64"
      sha256 "c848cd8bd73c39f9fecaa982d6e5280cf0b5abea794b22158b945c77bb466fc4"
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
