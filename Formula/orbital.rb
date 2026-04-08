class Orbital < Formula
  desc "Orbital — AI CLI environment manager for Claude Code, Codex, and Gemini CLI"
  homepage "https://github.com/OffskyLab/Orbital"
  version "0.1.8"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-darwin-arm64.tar.gz"
      sha256 "ce8496ade7423fc13b815356b21d47817b35fea5f4af262930859fb6ff088cdc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-linux-x86_64.tar.gz"
      sha256 "1065acd1d42bf429e8fccc48a935c36f40915abc6f3ab01e49a27325ab180cca"
    end
    on_arm do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-linux-arm64.tar.gz"
      sha256 "63d0159b5e62f000d118ebdeeadef7a0a50097c48c6f5578751116e41ebde16e"
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
