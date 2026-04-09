class OrbitalSync < Formula
  desc "P2P real-time sync daemon for Orbital — built on NMT protocol"
  homepage "https://github.com/OffskyLab/orbital-sync"
  version "1.0.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OffskyLab/orbital-sync/releases/download/v#{version}/orbital-sync-darwin-arm64.tar.gz"
      sha256 "a27713665b1a99934993abcf51f4ad606178ef2825f503c67ef6ccd75c7315f0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/OffskyLab/orbital-sync/releases/download/v#{version}/orbital-sync-linux-x86_64.tar.gz"
      sha256 "c108765137e58f4075d481b7ae41fb5f20c678f227cc99104e02a1f227055bb5"
    end
    on_arm do
      url "https://github.com/OffskyLab/orbital-sync/releases/download/v#{version}/orbital-sync-linux-arm64.tar.gz"
      sha256 "13a5762ac377885c80995e455d39c81c0c30866314357442384117a8f0bd9617"
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
