class YsaAgent < Formula
  desc "Agent daemon for ysa.run — runs issues in sandboxed containers"
  homepage "https://ysa.run"
  version "0.1.9"

  on_macos do
    on_arm do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.9/ysa-agent-darwin-arm64"
      sha256 "7c523d8031d811e28e007477411a23be4ca508d8ee9d90444f60495fdb53266d"
    end
    on_intel do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.9/ysa-agent-darwin-x64"
      sha256 "35002829adb4cea0901bbe32fd9f4c11e2197e81bcdc5bfe558845a18a3ee537"
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
