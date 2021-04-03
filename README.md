# Setup
[![GitHub version](https://badge.fury.io/gh/bretonics%2Fsetup.svg)](http://badge.fury.io/gh/bretonics%2Fsetup)
![License](https://img.shields.io/github/license/bretonics/setup)

[![GitHub Issues](https://img.shields.io/github/issues/bretonics/setup)](https://GitHub.com/bretonics/setup/issues/)
[![GitHub Pull-Requests](https://img.shields.io/github/issues-pr/bretonics/setup.svg)](https://GitHub.com/bretonics/setup/pull/)

![GitHub last commit](https://img.shields.io/github/last-commit/bretonics/setup?color=lightgrey)
![GitHub repo Size](https://img.shields.io/github/repo-size/bretonics/setup?color=orange)

## Automate Setting Up A New Mac
---

Options
---
The [Brewfile](https://github.com/bretonics/Setup/tree/master/src/Brewfile) contains everything, and is used in a `FULL` setup mode (default).

Files in [./src](https://github.com/bretonics/Setup/tree/master/src) keep track of individual programs (Apps, Formulae, and Casks) to install.

```
$ ./install.sh -h

Usage: install [Options] Brewfile


Running install without any options below will run a FULL setup by default.


Options:

    -F                      Full install setup (Defaults: -s=true)
    -E                      Essentials only installations
    -i [full|essentials]    More explicit install type declaration
    -s                      Run secondary installation (Default: false)
    -h                      Prints this usage message

Arguments:

    Brewfile                Path to Brew bundle file (Default: './src/Brewfile')
```

Secondary
---
Secondary setup modifies personalized Mac settings, and is run after initial install, `bash secondary.sh`.


## Customizable Setup
---
I suggest [downloading the repo](https://github.com/bretonics/Setup/archive/master.zip) and doing a [custom](#Customize-Setup) install. You probably want to do this...unless you really like everything configured as I do (we both know you don't).

- Download: [the repo](https://github.com/bretonics/Setup/archive/master.zip)
- Clone: `git clone --recurse-submodules https://github.com/bretonics/Setup.git`
- Fork: [the repo](https://github.com/bretonics/Setup)

You can also execute directly and run everything automatically with:
```
curl https://raw.githubusercontent.com/bretonics/Setup/master/setup | bash
```

> Cancel the auto run with `Ctrl-C` if you want to modify [apps.txt](https://github.com/bretonics/Setup/blob/master/src/apps.txt), [formulae.txt](https://github.com/bretonics/Setup/blob/master/src/formulae.txt), [casks.txt](https://github.com/bretonics/Setup/blob/master/src/casks.txt), and/or [Brewfile](https://github.com/bretonics/Setup/blob/master/src/Brewfile).

### Brewfile
Modify the `./src/Brewfile` and run `bash install`, or do `bash install /path/to/Brewfile`.

### Personalized
1. Modify files containing list of apps and their respective Mac App Store product identifiers, formulae, and/or casks that you want installed in the `/.src/` directory.

2. Run `bash install.sh`.

3. Optional: `bash secondary.sh`.


## Useful Commands
---
```
# List all installed Mac apps
mas list | sort -fk 2

# Create Brewfile
brew bundle dump
```