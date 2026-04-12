class Orbital < Formula
  desc "Orbital — AI CLI environment manager for Claude Code, Codex, and Gemini CLI"
  homepage "https://github.com/OffskyLab/Orbital"
  version "1.1.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-darwin-arm64.tar.gz"
      sha256 "28c5edb1fa0d4db63586423f6467f273a79684aa04e1a7b86a1b1ca3ab50151c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-linux-x86_64.tar.gz"
      sha256 "dede5d2ba10c3d0b86a65b6bd10d49b8e5e8f4c127f20c2d7ac41e3ffaad8090"
    end
    on_arm do
      url "https://github.com/OffskyLab/Orbital/releases/download/v#{version}/orbital-linux-arm64.tar.gz"
      sha256 "952d2c9cdbedcaf18eb6e62af6aecc6ed44d9c9bd521d9a1f791d5a703f6be02"
    end
  end

  depends_on "OffskyLab/orbital/orbital-sync"

  def install
    bin.install "orbital"
  end

  deprecate! date: "2026-04-13", because: "renamed to orrery. See https://github.com/OffskyLab/Orrery"

  def caveats
    <<~EOS
      ⚠️  Orbital has been renamed to Orrery.

      All new development happens at https://github.com/OffskyLab/Orrery.
      Migrate with:

        brew uninstall orbital
        brew install OffskyLab/orrery/orrery

      On first run, `orrery` will automatically move ~/.orbital/ to ~/.orrery/
      and update your shell rc file — no manual steps needed.

      This formula stays at v1.1.6 as a frozen snapshot; no further updates
      are planned. Existing workflows (including `orbital` invocations in
      scripts and MCP configs) keep working until you migrate.
    EOS
  end

  test do
    assert_match "#{version}", shell_output("#{bin}/orbital --version")
  end
end
