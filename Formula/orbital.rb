class Orbital < Formula
  desc "Orbital — AI CLI environment manager for Claude Code, Codex, and Gemini CLI"
  homepage "https://github.com/OffskyLab/Orbital"
  version "0.1.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-darwin-arm64.tar.gz"
      sha256 "db457f218f8c8a0ff38aca38d3dd70332ccc61db55ec9f4f2d622a1fc4bf5a03"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-linux-x86_64.tar.gz"
      sha256 "f2646ed761f0cf853e71946bd3c6ef11dbb753a875369f1b192178a1b6f6fabb"
    end
    on_arm do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-linux-arm64.tar.gz"
      sha256 "5c25ead7837a08a1b1cc149ac3098d88c0b6b2c9e8c540a4f7123217d9170a7e"
    end
  end

  def install
    bin.install "orbital"
  end

  def post_install
    system "#{bin}/orbital", "setup"
  end

  def caveats
    <<~EOS
      Shell integration has been added to your rc file automatically.
      To activate in your current shell, run:

        eval "$(orbital setup)"
    EOS
  end

  test do
    assert_match "#{version}", shell_output("#{bin}/orbital --version")
  end
end
