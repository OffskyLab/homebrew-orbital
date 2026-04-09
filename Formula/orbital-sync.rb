class OrbitalSync < Formula
  desc "P2P real-time sync daemon for Orbital — built on NMT protocol"
  homepage "https://github.com/OffskyLab/orbital-sync"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OffskyLab/orbital-sync/releases/download/v#{version}/orbital-sync-darwin-arm64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/OffskyLab/orbital-sync/releases/download/v#{version}/orbital-sync-linux-x86_64.tar.gz"
      sha256 "PLACEHOLDER"
    end
    on_arm do
      url "https://github.com/OffskyLab/orbital-sync/releases/download/v#{version}/orbital-sync-linux-arm64.tar.gz"
      sha256 "PLACEHOLDER"
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
