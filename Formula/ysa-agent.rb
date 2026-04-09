class YsaAgent < Formula
  desc "Agent daemon for ysa.run — runs issues in sandboxed containers"
  homepage "https://ysa.run"
  version "0.1.5"

  on_macos do
    on_arm do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.5/ysa-agent-darwin-arm64"
      sha256 "0451896c99dc270143b34cae7acf62f48b2b279930a1403635051495990a0e1f"
    end
    on_intel do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.5/ysa-agent-darwin-x64"
      sha256 "f6b9bf81f94740540f9c720beaedb795987e59f55acce2dc9da089b557799b39"
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
