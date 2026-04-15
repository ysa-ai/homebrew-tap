class YsaAgent < Formula
  desc "Agent daemon for ysa.run — runs issues in sandboxed containers"
  homepage "https://ysa.run"
  version "0.1.13"

  on_macos do
    on_arm do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.13/ysa-agent-darwin-arm64"
      sha256 "85afd36fa6d9c8a84ffcd9b90523530c8fa876436fcd2b47c1a75db994480241"
    end
    on_intel do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.13/ysa-agent-darwin-x64"
      sha256 "49fb1827be1318854977e899291adcdce57707cdad89c594bd26a0b76222891f"
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
