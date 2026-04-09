class Orbital < Formula
  desc "Orbital — AI CLI environment manager for Claude Code, Codex, and Gemini CLI"
  homepage "https://github.com/OffskyLab/Orbital"
  version "0.10.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-darwin-arm64.tar.gz"
      sha256 "4439c36b5a201083707af10102fc9270b492e53afba78c8ef0a8cb9326fc59b1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-linux-x86_64.tar.gz"
      sha256 "9c55f750e4be50798bcd5b0679d1a5a0b5e65b30d269dd66632bf7839849b955"
    end
    on_arm do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-linux-arm64.tar.gz"
      sha256 "e380c87b6fe7ef29d25fcacc18cd6cf946d1833561ca756620656e2e486ea9d2"
    end
  end

  def install
    bin.install "orbital"
  end

  def caveats
    <<~EOS
      To enable shell integration, run:

        eval "$(orbital setup)"

      This writes to your shell rc file and activates in the current shell.
    EOS
  end

  test do
    assert_match "#{version}", shell_output("#{bin}/orbital --version")
  end
end
