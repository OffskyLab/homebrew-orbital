class OrbitalSync < Formula
  desc "P2P real-time sync daemon for Orbital — built on NMT protocol"
  homepage "https://github.com/OffskyLab/orbital-sync"
  version "1.0.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OffskyLab/orbital-sync/releases/download/v#{version}/orbital-sync-darwin-arm64.tar.gz"
      sha256 "26025134aaa3c2311a5321c98f4ff7345f7898ff454e72d797619720d431111d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/OffskyLab/orbital-sync/releases/download/v#{version}/orbital-sync-linux-x86_64.tar.gz"
      sha256 "7f9995465f141ba30fcd7988d0d7c2a70489b1c0b02e8137a0d003996590aaea"
    end
    on_arm do
      url "https://github.com/OffskyLab/orbital-sync/releases/download/v#{version}/orbital-sync-linux-arm64.tar.gz"
      sha256 "3a6ee93628642dd6e6b1a41afa43c61269685d36905229c6c29788c3270b377b"
    end
  end

  def install
    bin.install "orbital-sync"
  end

  def caveats
    <<~EOS
      To use with Orbital CLI:

        orbital sync daemon --port 9527

      Or run directly:

        orbital-sync daemon --port 9527
    EOS
  end

  test do
    assert_match "#{version}", shell_output("#{bin}/orbital-sync --version")
  end
end
