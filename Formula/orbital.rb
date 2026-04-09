class Orbital < Formula
  desc "Orbital — AI CLI environment manager for Claude Code, Codex, and Gemini CLI"
  homepage "https://github.com/OffskyLab/Orbital"
  version "1.0.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-darwin-arm64.tar.gz"
      sha256 "a8f6e86a9809fa7feeb25b04f1ced2cbe13451b472728814061ecc51c5b28d7c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-linux-x86_64.tar.gz"
      sha256 "ace6e46a45f506847e204a654a26abb9abf56b94155eed6d3980494363d139ee"
    end
    on_arm do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-linux-arm64.tar.gz"
      sha256 "62d59b8461b62b722536005c6d2c055d347f964e1e49a9c9e85a694e0e87b566"
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

        orbital use default
    EOS
  end

  test do
    assert_match "#{version}", shell_output("#{bin}/orbital --version")
  end
end
