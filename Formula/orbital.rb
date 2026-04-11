class Orbital < Formula
  desc "Orbital — AI CLI environment manager for Claude Code, Codex, and Gemini CLI"
  homepage "https://github.com/OffskyLab/Orbital"
  version "1.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-darwin-arm64.tar.gz"
      sha256 "06ecd9d8c0c6b6738e63f593f45f786c92b069add47b4a3d06f2d1dcbf91cd33"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-linux-x86_64.tar.gz"
      sha256 "0a17582509d78b18e38b8269390869c512b71cbc075e2bb79c6cfd2452037a79"
    end
    on_arm do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-linux-arm64.tar.gz"
      sha256 "a562a71bb6a66d898392434d3bab041f9903b6ff101c61b35e2709ba4b8985e3"
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
