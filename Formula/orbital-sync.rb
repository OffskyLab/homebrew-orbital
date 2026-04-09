class OrbitalSync < Formula
  desc "P2P real-time sync daemon for Orbital — built on NMT protocol"
  homepage "https://github.com/OffskyLab/orbital-sync"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OffskyLab/orbital-sync/releases/download/v#{version}/orbital-sync-darwin-arm64.tar.gz"
      sha256 "65bd31d5e8dd8af7b96c1d5bee959a5f330b6fb30e7b509d989d55e4fe611e61"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/OffskyLab/orbital-sync/releases/download/v#{version}/orbital-sync-linux-x86_64.tar.gz"
      sha256 "a617eaecb09e24320792f4ce8dac1d5ddd6a00458a78b1e4e58ab0831a7276aa"
    end
    on_arm do
      url "https://github.com/OffskyLab/orbital-sync/releases/download/v#{version}/orbital-sync-linux-arm64.tar.gz"
      sha256 "3ec87d1d9631beb29fa993470eb692b1db9b8b9ed634ad03ce6e86038ccefc0a"
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
