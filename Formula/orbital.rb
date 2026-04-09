class Orbital < Formula
  desc "Orbital — AI CLI environment manager for Claude Code, Codex, and Gemini CLI"
  homepage "https://github.com/OffskyLab/Orbital"
  version "0.1.9"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-darwin-arm64.tar.gz"
      sha256 "0213d59f9abebe11e4ff579dec618ec5537f7f2bb35ba9570c92084985e8aee9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-linux-x86_64.tar.gz"
      sha256 "0c6ae44565fb20a46ac30d204b00b35f65cbb90f4078bbc78471da0ffd088e83"
    end
    on_arm do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-linux-arm64.tar.gz"
      sha256 "518838924c54b8d7295c5616bb82ec2d08a0f9c092b73c94e88aae9d037b3758"
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
