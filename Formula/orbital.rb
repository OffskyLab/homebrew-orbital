class Orbital < Formula
  desc "Orbital — AI CLI environment manager for Claude Code, Codex, and Gemini CLI"
  homepage "https://github.com/OffskyLab/Orbital"
  version "1.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-darwin-arm64.tar.gz"
      sha256 "2f2e1b8e3ef7e3a7985e18d9aff96012a3cfd97bd3bde4df56b0197b2528dd1e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-linux-x86_64.tar.gz"
      sha256 "f4c3427207d278944abd0e6cec8cbb4ed3d77a8f42557f4db6f66fd42c6b7fa1"
    end
    on_arm do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-linux-arm64.tar.gz"
      sha256 "9b3ba8fe6b56e886acafde4b351e8ba44e04553dc956918d52fea0d654d7d96e"
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
