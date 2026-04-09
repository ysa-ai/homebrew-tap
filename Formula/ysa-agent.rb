class YsaAgent < Formula
  desc "Agent daemon for ysa.run — runs issues in sandboxed containers"
  homepage "https://ysa.run"
  version "0.1.10"

  on_macos do
    on_arm do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.10/ysa-agent-darwin-arm64"
      sha256 "d0acda6dd2d1eeda58c24ef3c0f126ae1118e234b41ec9d1bef6ea23fb252d3a"
    end
    on_intel do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.10/ysa-agent-darwin-x64"
      sha256 "036b68bd407637695df45d67bf5fa1c8bcd68ee70732c377376fd93514c845d5"
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
