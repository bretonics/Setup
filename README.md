# Setup

[![GitHub Version](https://badge.fury.io/gh/bretonics%2FSetup.svg)](http://badge.fury.io/gh/bretonics%2Fsetup)
![Release Date](https://img.shields.io/github/release-date/bretonics/Setup?color=success)
[![MIT License](https://img.shields.io/badge/License-MIT-red.svg)](https://bretonics.mit-license.org/)
![Used By](https://img.shields.io/sourcegraph/rrc/github.com/bretonics/Setup?color=blue)
[![](https://img.shields.io/github/license/bretonics/Setup?color=blue)](https://github.com/bretonics/Setup/blob/master/LICENSE.md)

![Commits Since](https://img.shields.io/github/commits-since/bretonics/Setup/latest)
![GitHub last commit](https://img.shields.io/github/last-commit/bretonics/Setup?color=lightgrey)
![GitHub Commit Activity](https://img.shields.io/github/commit-activity/m/bretonics/Setup?color=yellow)
![GitHub repo Size](https://img.shields.io/github/repo-size/bretonics/Setup?color=orange)
![Lines of Code](https://img.shields.io/tokei/lines/github/bretonics/Setup)

[![GitHub Issues](https://img.shields.io/github/issues/bretonics/setup)](https://GitHub.com/bretonics/setup/issues/)
[![GitHub Pull-Requests](https://img.shields.io/github/issues-pr/bretonics/Setup.svg)](https://GitHub.com/bretonics/setup/pull/)

[![GitHub](https://img.shields.io/github/followers/bretonics?label=Follow%20%40bretonics&style=social)](https://github.com/bretonics)
[![Twitter](https://img.shields.io/twitter/follow/bretonics?style=social)](https://twitter.com/bretonics)

## Automate Mac Setup

Get most of the tedious configurations, applications, and other settings automatically setup on a clean macOS install. New Mac? Clean macOS install? Run Setup and automate it all.

``` bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/bretonics/Setup/HEAD/setup)"
```

> Cancel the auto run with `Ctrl-C` if you want to modify [apps.txt](https://github.com/bretonics/Setup/blob/master/src/apps.txt), [formulae.txt](https://github.com/bretonics/Setup/blob/master/src/formulae.txt), [casks.txt](https://github.com/bretonics/Setup/blob/master/src/casks.txt), and/or [Brewfile](https://github.com/bretonics/Setup/blob/master/src/Brewfile).
>
> See [Customizable Setup](#customizable-setup) for a better way to utilize a custom Setup.

<br>

- Installs [Homebrew](https://brew.sh/)
- Installs Xcode Developer Tools
- Installs [necessary applications and tools](https://github.com/bretonics/Setup/blob/master/src/Brewfile)
- Sets up environment (executables/tools (git, npm, etc), shells (defaults, prompts, etc), CLIs, and more)
- Additional [environment configurations](https://github.com/bretonics/Setup/blob/master/bin/settings_defaults.sh)
- Updates macOS

Options
---

The [Brewfile](https://github.com/bretonics/Setup/tree/master/src/Brewfile) contains everything, and is used in a `FULL` setup mode (default).

Files in [./src](https://github.com/bretonics/Setup/tree/master/src) keep track of individual programs (Apps, Formulae, and Casks) to install.

``` bash
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

---

## Customizable Setup

I suggest using your own Brewfile. If you don't have one, see [Useful Commands](#useful-commands) to create one, and pass this to the program as followed:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/bretonics/Setup/HEAD/setup)" "" ~/absolute/path/to/Brewfile
```

You can also pass any of the available [options](#options):

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/bretonics/Setup/HEAD/setup)" "" -E
```

### Manual

You probably want to do this --unless you really like everything configured as I do (we both know you don't)--and don't have a Brewfile to run a [customized setup](#customizable-setup).

[Download the repo](https://github.com/bretonics/Setup/archive/master.zip) or [fork](https://github.com/bretonics/Setup) it to do a custom install and modify the following:

**Brewfile**

Modify the `./src/Brewfile` and run `bash install`, or do `bash install /path/to/Brewfile`.

**Personalizations**

1. Modify files containing list of apps and their respective Mac App Store product identifiers, formulae, and/or casks that you want installed in the [src](https://github.com/bretonics/Setup/tree/master/src) directory.

2. Run `bash install.sh`.

3. Optional: `bash secondary.sh`.

---

## Useful Commands

```bash
# List all installed Mac apps
mas list | sort -fk 2

# Create Brewfile
brew bundle dump
```
