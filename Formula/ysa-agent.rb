class YsaAgent < Formula
  desc "Agent daemon for ysa.run — runs issues in sandboxed containers"
  homepage "https://ysa.run"
  version "0.1.11"

  on_macos do
    on_arm do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.11/ysa-agent-darwin-arm64"
      sha256 "ff68477b3df164a3758c5aea6a7e7dde76ccc56c5b7c63391edd223731d8695f"
    end
    on_intel do
      url "https://github.com/ysa-ai/agent/releases/download/agent-v0.1.11/ysa-agent-darwin-x64"
      sha256 "b0102ca1ec1243ff01fcb8945b6449f4c2a580875ab706c92e69daf870390445"
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
