class Orbital < Formula
  desc "Orbital — AI CLI environment manager for Claude Code, Codex, and Gemini CLI"
  homepage "https://github.com/OffskyLab/Orbital"
  version "1.0.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-darwin-arm64.tar.gz"
      sha256 "7205eb78388382591356338442a91a8dfdc6ec2ed6c7b2440b7bb98fa3826a02"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-linux-x86_64.tar.gz"
      sha256 "507570e870423b2f16365803eb7523e925ad70e18c2dc22e65a3b5cca11f80a6"
    end
    on_arm do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-linux-arm64.tar.gz"
      sha256 "69040f7b810a26fbb0346a48354852932b49d6fe484e98662c04caa527b0e2b3"
    end
  end

  depends_on "OffskyLab/orbital/orbital-sync"

  def install
    bin.install "orbital"
  end

  def caveats
    <<~EOS
      To get started, run:

        orbital setup && source ~/.orbital/activate.sh

      To return to your original config at any time:

        orbital use origin
    EOS
  end

  test do
    assert_match "#{version}", shell_output("#{bin}/orbital --version")
  end
end
