class YsaAgent < Formula
  desc "Agent daemon for ysa.run — runs issues in sandboxed containers"
  homepage "https://ysa.run"
  version "0.1.15"

  on_macos do
    on_arm do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.15/ysa-agent-darwin-arm64"
      sha256 "f4b2f5f8a8008a17eed51b44fb9f4d86d3b6fbf1ea41101d93d1e8c4d32d3508"
    end
    on_intel do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.15/ysa-agent-darwin-x64"
      sha256 "8e59b163ec1ff4ba41f3dfc9a48715c04b4cf30606ab84241656107ad9628f5a"
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
