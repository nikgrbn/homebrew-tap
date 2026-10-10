class FinderMenu < Formula
  desc "Adds New File, Open Terminal Here and more to Finder's right-click menu"
  homepage "https://github.com/nikgrbn/finder-menu"
  url "https://github.com/nikgrbn/finder-menu/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "34fc1eae3c6030a189b85bcdc575299a6db8b15033226171c6387fdcf8f5c12b"
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

      Run it again after `brew upgrade finder-menu`.

      To choose the terminal for Open Terminal Here:
        finder-menu terminal Ghostty
      Before `brew uninstall finder-menu`, run:
        finder-menu disable
    EOS
  end

  test do
    assert_path_exists prefix/"Finder Menu.app/Contents/PlugIns/FinderMenuExtension.appex"
    system "codesign", "--verify", "--deep", prefix/"Finder Menu.app"
  end
end
