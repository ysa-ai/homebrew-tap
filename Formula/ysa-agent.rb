class YsaAgent < Formula
  desc "Agent daemon for ysa.run — runs issues in sandboxed containers"
  homepage "https://ysa.run"
  version "0.1.12"

  on_macos do
    on_arm do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.12/ysa-agent-darwin-arm64"
      sha256 "3daeba1e298ef4dbab7110fd9482043cd81c7770bfc81a9ae8817649f611e70b"
    end
    on_intel do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.12/ysa-agent-darwin-x64"
      sha256 "0c785fd8be397868467d1670cd62ce76a8dba2a16b253af9c370e7fa1ec9b70f"
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
