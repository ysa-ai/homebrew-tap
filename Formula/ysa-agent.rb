class YsaAgent < Formula
  desc "Agent daemon for ysa.run — runs issues in sandboxed containers"
  homepage "https://ysa.run"
  version "0.1.21"

  on_macos do
    on_arm do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.21/ysa-agent-darwin-arm64"
      sha256 "7385bc1f055be8e6b7037e5c224058a1c3877b3bbc664e71e1ae44597139a82b"
    end
    on_intel do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.21/ysa-agent-darwin-x64"
      sha256 "0835ae4d31e3ab16dedbe8dfe8b33ea057e3e164bb1f2327cd81487a4003578f"
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
