class Orbital < Formula
  desc "Orbital — AI CLI environment manager for Claude Code, Codex, and Gemini CLI"
  homepage "https://github.com/OffskyLab/Orbital"
  version "0.1.8"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-darwin-arm64.tar.gz"
      sha256 "5e65ce408792137474da4fba8090f649567f41ca43c69f14373160fba9475f61"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-linux-x86_64.tar.gz"
      sha256 "45b537b709e4c4c7e6c1898a03c794d838beb8059daa015e8c21c4e728a3baf4"
    end
    on_arm do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-linux-arm64.tar.gz"
      sha256 "c15325b6616d9d651f7690bab5bd6ac6563efdd1e9ec8404c04d715637609b40"
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
