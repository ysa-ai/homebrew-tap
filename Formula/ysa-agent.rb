class YsaAgent < Formula
  desc "Agent daemon for ysa.run — runs issues in sandboxed containers"
  homepage "https://ysa.run"
  version "0.1.16"

  on_macos do
    on_arm do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.16/ysa-agent-darwin-arm64"
      sha256 "f842a855456aaee54a1302d9a0ff91f48e5b11ee159d0ae4887669511a58b906"
    end
    on_intel do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.16/ysa-agent-darwin-x64"
      sha256 "671f75766a0b048f1f26ffbc235ef196918f3b9ea959b379e061d8f11427dbbe"
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
