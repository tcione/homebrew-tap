class Forest < Formula
  desc "A CLI tool to make working with easier by establishing a few conventions and abstracting away some git commands."
  homepage "https://github.com/tcione/forest"
  version "0.11.1"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tcione/forest/releases/download/v#{version}/forest-macos-x86_64"
      sha256 "89a7fdb8732b0dd3c18608045a3f2e4401da25b81b214e1d4a86252530c48e06"
    else
      url "https://github.com/tcione/forest/releases/download/v#{version}/forest-macos-aarch64"
      sha256 "4b67b4c66f4251318a11719d700ebf88fa0488129c33bba382bc7269e160996c"
    end
  end

  depends_on "git"

  def install
    # Install the binary
    if Hardware::CPU.intel?
      bin.install "forest-macos-x86_64" => "forest"
    else
      bin.install "forest-macos-aarch64" => "forest"
    end
  end

   def caveats
    <<~EOS
      To enable the fogo command for quick navigation,
  see:
      https://github.com/tcione/forest?tab=readme-ov-file#bonus-shell-integration-fogo-command
    EOS
  end

  test do
    system "#{bin}/forest", "--help"
    assert_match "Convention-over-configuration CLI tool to manager git worktrees", shell_output("#{bin}/forest --help")
  end
end
