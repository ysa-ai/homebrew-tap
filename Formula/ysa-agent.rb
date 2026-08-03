class YsaAgent < Formula
  desc "Agent daemon for ysa.run — runs issues in sandboxed containers"
  homepage "https://ysa.run"
  version "0.1.23"

  on_macos do
    on_arm do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.23/ysa-agent-darwin-arm64"
      sha256 "5672a5afa1f5af5d5b068ac2303f42a15947f78c7d420c725f58b15c45d2dab6"
    end
    on_intel do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.23/ysa-agent-darwin-x64"
      sha256 "56634397e807adfefb9fcc95bf11e7ada2fa5820f61d878cd3849b21654cf176"
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
