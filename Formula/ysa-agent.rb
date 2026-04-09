class YsaAgent < Formula
  desc "Agent daemon for ysa.run — runs issues in sandboxed containers"
  homepage "https://ysa.run"
  version "0.1.6"

  on_macos do
    on_arm do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.6/ysa-agent-darwin-arm64"
      sha256 "35c55b9cde33fe5a7c0c0fd9ed32e9455384146d3ca47a89782d83831f31a8b4"
    end
    on_intel do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.6/ysa-agent-darwin-x64"
      sha256 "c15706d85788943a5afa949f1cacbecc05001dd7752ad57e3ef3148609ccf19d"
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
