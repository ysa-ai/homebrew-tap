class YsaAgent < Formula
  desc "Agent daemon for ysa.run — runs issues in sandboxed containers"
  homepage "https://ysa.run"
  version "0.1.22"

  on_macos do
    on_arm do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.22/ysa-agent-darwin-arm64"
      sha256 "8871a4d50e02adb38c82cb470e10eb810de223fa47692c7dac41dfa8fc4af731"
    end
    on_intel do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.22/ysa-agent-darwin-x64"
      sha256 "469a072d006f409c1e5f8de08e01392e22615552f7db8272b5d28ab9740d9f6c"
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
