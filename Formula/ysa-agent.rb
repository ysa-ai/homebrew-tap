class YsaAgent < Formula
  desc "Agent daemon for ysa.run — runs issues in sandboxed containers"
  homepage "https://ysa.run"
  version "0.1.2"

  on_macos do
    on_arm do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.2/ysa-agent-darwin-arm64"
      sha256 "aee5890043fc4b50bfae5f5f5fef1fa9d16dff0e5dc0f3f266dbe3173f1391e9"
    end
    on_intel do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.2/ysa-agent-darwin-x64"
      sha256 "83425a6334c6eae07be44f177166e5559ee174dd226bccbccfbf4cb25c7f5506"
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
