# nikgrbn/tap

Homebrew formulae by [@nikgrbn](https://github.com/nikgrbn).

## Finder Menu

Adds **New File…**, **Open Terminal Here**, **Open Folder With ▸**, **Copy Path** and **Go to Parent Folder** to Finder's right-click menu. See the [project page](https://github.com/nikgrbn/finder-menu).

```bash
brew install nikgrbn/tap/finder-menu
finder-menu enable
```

It's built from source on your Mac. To update, run `brew update && brew upgrade finder-menu`, then `finder-menu enable` again (without `brew update`, Homebrew checks for new versions only once a day). Run `finder-menu disable` before `brew uninstall`. Pick the terminal for Open Terminal Here with `finder-menu terminal <app>`.
