class Orbital < Formula
  desc "AI CLI environment manager for Claude Code, Codex, and Gemini CLI"
  homepage "https://github.com/OffskyLab/orbital"
  url "https://github.com/OffskyLab/orbital/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "9c06ccbc35efd04b49104867dfc4c8a5ca38f48f0e4fa77523d68307fbd0a927"
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
    assert_match "0.1.1", shell_output("#{bin}/orbital --version")
  end
end
