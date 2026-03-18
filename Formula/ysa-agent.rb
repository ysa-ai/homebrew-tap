class YsaAgent < Formula
  desc "Agent daemon for ysa.run — runs issues in sandboxed containers"
  homepage "https://ysa.run"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.0/ysa-agent-darwin-arm64"
      sha256 "d7b111945493a9c5d02770e6d9364dcbe0750a4fcb3a091946c2855e6eadcea8"
    end
    on_intel do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.0/ysa-agent-darwin-x64"
      sha256 "9ce4669db988a97ecba8aca2f7e9c854dd93d6b66d1fc228a907997abcc0ef7c"
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
