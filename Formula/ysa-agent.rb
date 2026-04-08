class YsaAgent < Formula
  desc "Agent daemon for ysa.run — runs issues in sandboxed containers"
  homepage "https://ysa.run"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.1/ysa-agent-darwin-arm64"
      sha256 "53b650b265b48a30c775673bc35c7c0e154c415e7086a04f4fccc0450fb5e8be"
    end
    on_intel do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.1/ysa-agent-darwin-x64"
      sha256 "1f7f6df97f1618c7d52ad543685dc9cbd497d9bc364d8906e0fd0556568332df"
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
