class YsaAgent < Formula
  desc "Agent daemon for ysa.run — runs issues in sandboxed containers"
  homepage "https://ysa.run"
  version "0.1.7"

  on_macos do
    on_arm do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.7/ysa-agent-darwin-arm64"
      sha256 "56d50d0fa31681d797d102da10cf021c90b128f84d6ae670f71ad45ef7081ef5"
    end
    on_intel do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.7/ysa-agent-darwin-x64"
      sha256 "4601d9bdc939edf4ee3dfc16870c77f1111f3d95d89ccf3594646d751cf6d601"
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
