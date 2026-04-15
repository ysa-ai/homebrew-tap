class YsaAgent < Formula
  desc "Agent daemon for ysa.run — runs issues in sandboxed containers"
  homepage "https://ysa.run"
  version "0.1.14"

  on_macos do
    on_arm do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.14/ysa-agent-darwin-arm64"
      sha256 "860c9933e91f80bd3cf3b60ebd29dbb2da95708afff00f134b41bd4d4d067b7f"
    end
    on_intel do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.14/ysa-agent-darwin-x64"
      sha256 "8a6e8ef8f504b7b231cf3b6ab1c3ccc9605ae39575d861a599cbf0011a30ce78"
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
