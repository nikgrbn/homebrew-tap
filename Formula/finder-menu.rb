class FinderMenu < Formula
  desc "Adds New File, Open Terminal Here and more to Finder's right-click menu"
  homepage "https://github.com/nikgrbn/finder-menu"
  url "https://github.com/nikgrbn/finder-menu/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "6b5262b2814b95ae159effbd1a8b3331a0b85eeee2f34dac651f1bd9c5f76354"
  license "MIT"

  depends_on macos: :ventura

  def install
    system "scripts/build.sh", prefix
    bin.install "scripts/finder-menu"
  end

  def caveats
    <<~EOS
      To add Finder Menu to Finder's right-click menu, run:
        finder-menu enable

      To update later, run this, then `finder-menu enable` again:
        brew update && brew upgrade finder-menu

      To choose which items appear and which terminal opens:
        finder-menu settings

      Before `brew uninstall finder-menu`, run:
        finder-menu disable
    EOS
  end

  test do
    assert_path_exists prefix/"Finder Menu.app/Contents/PlugIns/FinderMenuExtension.appex"
    system "codesign", "--verify", "--deep", prefix/"Finder Menu.app"
  end
end
