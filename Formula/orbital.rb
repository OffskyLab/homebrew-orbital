class Orbital < Formula
  desc "Orbital — AI CLI environment manager for Claude Code, Codex, and Gemini CLI"
  homepage "https://github.com/OffskyLab/Orbital"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-darwin-arm64.tar.gz"
      sha256 "5e341dbbbb49de5b96bb40731c4e6cf2633360b17b1e447546f4e82f85cedec8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-linux-x86_64.tar.gz"
      sha256 "40b9873f110c34ce372bbcf713cd3ab79a982c6bcd707d17c3049362da0f6563"
    end
    on_arm do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-linux-arm64.tar.gz"
      sha256 "42e6c9fb94fff1e339a0c3dbeb5a1ea51b6a9c0fa05a9e542c337674167c2830"
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
      Shell integration has been installed. To activate in your current shell:

        source ~/.orbital/activate.sh

      To return to your original config at any time:

        orbital use default
    EOS
  end

  test do
    assert_match "#{version}", shell_output("#{bin}/orbital --version")
  end
end
