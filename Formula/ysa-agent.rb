class YsaAgent < Formula
  desc "Agent daemon for ysa.run — runs issues in sandboxed containers"
  homepage "https://ysa.run"
  version "0.1.20"

  on_macos do
    on_arm do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.20/ysa-agent-darwin-arm64"
      sha256 "485b1afe302424ea4c6b01f862e7692d1f0cb1b41ba1dfe81abe0612fa8da52f"
    end
    on_intel do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.20/ysa-agent-darwin-x64"
      sha256 "ab93da45a218b5027012545b0615c0753eb2e2febd6f1ebf2b1d2f849e7f84ae"
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
