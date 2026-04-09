class Orbital < Formula
  desc "Orbital — AI CLI environment manager for Claude Code, Codex, and Gemini CLI"
  homepage "https://github.com/OffskyLab/Orbital"
  version "0.2.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-darwin-arm64.tar.gz"
      sha256 "be164976951564082285e1adb7f5f878549267edbfc936420191eff7573a4f20"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-linux-x86_64.tar.gz"
      sha256 "0132eb75a93b215cbcd76d5fee64fd1573722edfdb6c1f58b37e4f375930d48c"
    end
    on_arm do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-linux-arm64.tar.gz"
      sha256 "1d5adb38d02b509a214b732eace762f42009d1217f63ba6e758ca63361400972"
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
