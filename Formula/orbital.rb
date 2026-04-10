class Orbital < Formula
  desc "Orbital — AI CLI environment manager for Claude Code, Codex, and Gemini CLI"
  homepage "https://github.com/OffskyLab/Orbital"
  version "1.0.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-darwin-arm64.tar.gz"
      sha256 "0316a0617293cabc2f5735a526ee82e6c45bc42769789adaef62b6ca704af7df"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-linux-x86_64.tar.gz"
      sha256 "6d19a05aaa22f9f2987dceb4bc831f86827417d1a74604b0fc1abc8ed377bc5a"
    end
    on_arm do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-linux-arm64.tar.gz"
      sha256 "6f94ae2d327c00b7d5319f1b318a2c249e7c237404b873c4d42d6cf2c89b68df"
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
