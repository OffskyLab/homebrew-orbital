class Orbital < Formula
  desc "AI CLI environment manager for Claude Code, Codex, and Gemini CLI"
  homepage "https://github.com/OffskyLab/orbital"
  url "https://github.com/OffskyLab/orbital/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "249346875ca68a1c0cf2e8bd9b14dd46a655de9fe96930b7764053835dd234b9"
  license "MIT"
  head "https://github.com/OffskyLab/orbital.git", branch: "main"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "--configuration", "release", "--disable-sandbox"
    bin.install ".build/release/orbital"
  end

  def caveats
    <<~EOS
      Add orbital shell integration to your ~/.zshrc by running:
        orbital setup

      Or manually:
        echo 'eval "$(orbital init)"' >> ~/.zshrc
        source ~/.zshrc
    EOS
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/orbital --version")
  end
end
