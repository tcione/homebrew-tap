class Forest < Formula
  desc "A CLI tool to make working with easier by establishing a few conventions and abstracting away some git commands."
  homepage "https://github.com/tcione/forest"
  version "0.11.1"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tcione/forest/releases/download/v#{version}/forest-macos-x86_64"
      sha256 "bafe2d8827775f1c58c3fdd46fe55fbd80f920f95d36b7a17921e3c2150da913"
    else
      url "https://github.com/tcione/forest/releases/download/v#{version}/forest-macos-aarch64"
      sha256 "e6d9e09d9b6525022f83aa065d93a87b03a823bcaf87c5d8b0776d6f3467edf9"
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
