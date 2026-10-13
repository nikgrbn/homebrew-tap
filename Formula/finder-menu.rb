class FinderMenu < Formula
  desc "Adds New File, Open Terminal Here and more to Finder's right-click menu"
  homepage "https://github.com/nikgrbn/finder-menu"
  url "https://github.com/nikgrbn/finder-menu/archive/refs/tags/v1.5.3.tar.gz"
  sha256 "39f3bf1aa1816fad2b446dd118d7c38a2bdff8cc66688af8dc51bc7b20c94d74"
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
