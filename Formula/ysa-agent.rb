class YsaAgent < Formula
  desc "Agent daemon for ysa.run — runs issues in sandboxed containers"
  homepage "https://ysa.run"
  version "0.1.8"

  on_macos do
    on_arm do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.8/ysa-agent-darwin-arm64"
      sha256 "736e8df524934f85459330152489f9413e0c3dc1315bbc960f7e91347327a11b"
    end
    on_intel do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.8/ysa-agent-darwin-x64"
      sha256 "76b8bf558751b26ae7e2c2f1bd3282cab60ad38e994cc506eddd45763bd11762"
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
