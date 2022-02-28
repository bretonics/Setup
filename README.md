# Setup

[![GitHub Version](https://badge.fury.io/gh/bretonics%2FSetup.svg)](http://badge.fury.io/gh/bretonics%2Fsetup)
![Release Date](https://img.shields.io/github/release-date/bretonics/Setup?color=success)
[![MIT License](https://img.shields.io/badge/License-MIT-red.svg)](https://bretonics.mit-license.org/)
![Used By](https://img.shields.io/sourcegraph/rrc/github.com/bretonics/Setup?color=blue)
[![](https://img.shields.io/github/license/bretonics/Setup?color=blue)](https://github.com/bretonics/Setup/blob/main/LICENSE.md)

![Commits Since](https://img.shields.io/github/commits-since/bretonics/Setup/latest)
![GitHub last commit](https://img.shields.io/github/last-commit/bretonics/Setup?color=lightgrey)
![GitHub Commit Activity](https://img.shields.io/github/commit-activity/m/bretonics/Setup?color=yellow)
![GitHub repo Size](https://img.shields.io/github/repo-size/bretonics/Setup?color=orange)
![Lines of Code](https://img.shields.io/tokei/lines/github/bretonics/Setup)

[![GitHub Issues](https://img.shields.io/github/issues/bretonics/setup)](https://GitHub.com/bretonics/setup/issues/)
[![GitHub Pull-Requests](https://img.shields.io/github/issues-pr/bretonics/Setup.svg)](https://GitHub.com/bretonics/setup/pull/)

[![GitHub](https://img.shields.io/github/followers/bretonics?label=Follow%20%40bretonics&style=social)](https://github.com/bretonics)
[![Twitter](https://img.shields.io/twitter/follow/bretonics?style=social)](https://twitter.com/bretonics)

- [Setup](#setup)
  - [Automate Mac Setup](#automate-mac-setup)
  - [Installation Types](#installation-types)
    - [Main](#main)
    - [Essentials](#essentials)
    - [Secondary](#secondary)
  - [Modes](#modes)
  - [Options](#options)
  - [Customizable Setup](#customizable-setup)
    - [Manual](#manual)
  - [Useful Commands](#useful-commands)
  - [Contribute](#contribute)

## Automate Mac Setup

New Mac? Clean macOS install? Run Setup and automate it all!

Get most of the tedious configurations, application installs, and other settings automatically configured on your Mac.

- Installs [Homebrew](https://brew.sh/)
- Installs Xcode Developer Tools
- Installs [necessary applications and tools](https://github.com/bretonics/Setup/blob/main/src/Brewfile)
- Sets up environment (executables/tools (git, npm, etc), shells (defaults, prompts, etc), CLIs, and more)
- Additional [environment configurations](https://github.com/bretonics/Setup/blob/main/bin/settings_defaults.sh)
- Updates macOS
  
Start with a [Customizable Setup](#customizable-setup) run.

---

``` bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/bretonics/Setup/HEAD/setup.sh)"
```

> Cancel the auto run with `Ctrl-C` if you want to modify [apps.txt](https://github.com/bretonics/Setup/blob/main/src/apps.txt), [formulae.txt](https://github.com/bretonics/Setup/blob/main/src/formulae.txt), [casks.txt](https://github.com/bretonics/Setup/blob/main/src/casks.txt), and/or [Brewfile](https://github.com/bretonics/Setup/blob/main/src/Brewfile).
>
> See [Customizable Setup](#customizable-setup) for a better way to utilize a custom Setup.

## Installation Types

### Main

This install includes the entire app, formulae, and cask collection, including those in the [essentials](#essentials) install type and all [modes](#modes). This is more for something like a Mac mini.

See the default [Brewfile](https://github.com/bretonics/Setup/tree/main/src/Brewfile).

### Essentials

This install includes a smaller subset of what I deem essential, must haves. It's intended more for a Macbook Pro where you don't need everything under the sun.

See the default [Brewfile](https://github.com/bretonics/Setup/tree/main/src/essentials/Brewfile).

### Secondary

Secondary setup modifies personalized Mac settings, and is run after the initial install. It requires more attention as it may ask for credential or information input. It runs by default if running 'main' type. You must pass the `-s` option otherwise, or you can always run it directly `bash ./secondary.sh`.

## Modes

Directories in [./src/mode](https://github.com/bretonics/Setup/tree/main/src) separate other installation modes that can be run in addition to the 'main' or 'essentials' install chosen.

Each directory keeps track of individual programs (Apps, Formulae, and Casks) to install for the specific mode, via their own `Brewfile`, and includes an `install.sh` for all logic pertaining to the mode.

Available modes:

- dev
- fun

Options
---

``` bash
$ ./install.sh -h

Usage: install.sh [Options] Brewfile


Running install without any options below will run a MAIN setup by default.


Options:

    -B                      Sync backups from latest Time Machine backup
    -D                      Use defaults (skip confirmation when applying secondary settings)
    -E                      Essentials only installations
    -F                      Run full main install with defaults (Sets -B, -D, -P, and -s)
    -M                      Main install type (-s=true)
    -P                      Set Mac setting system preference defaults (Default: false)
    -i [main|essentials]    Explicit install type declaration, i.e. -M or -E)
    -m <mode>               Run additional specified mode installation (in ./src/mode)
    -s                      Run secondary installation (Default: false)
    -h                      Prints this usage message

Arguments:

    Brewfile                Path to Brew bundle file (Default: './src/Brewfile')
```

## Customizable Setup

I suggest using your own Brewfile. If you don't have one, see [Useful Commands](#useful-commands) to create one before running Setup, and pass this to the program as followed:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/bretonics/Setup/HEAD/setup.sh)" "" ~/absolute/path/to/Brewfile
```

You can also pass any of the available [options](#options):

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/bretonics/Setup/HEAD/setup.sh)" "" -E
```

### Manual

You probably want to do this --unless you really like everything configured as I do (we both know you don't)--and don't have a Brewfile to run a [customized setup](#customizable-setup).

[Download the repo](https://github.com/bretonics/Setup/archive/main.zip) or [fork](https://github.com/bretonics/Setup) it to do a custom install and modify the following:

**Brewfile**

Modify the `./src/Brewfile` and run `bash install`, or pass your own: `bash install /absolute/path/to/my/Brewfile`.

**Personalizations**

1. Modify files containing list of apps and their respective Mac App Store product identifiers, formulae, and/or casks that you want installed in the [src](https://github.com/bretonics/Setup/tree/main/src) directory.

2. Run `bash install.sh -E`

3. Optional: `bash secondary.sh`

---

## Useful Commands

```bash
# List all installed Mac apps
mas list | sort -fk 2

# Create Brewfile
brew bundle dump
```

## Contribute

Have a particular set of configurations to add? Feel free to create a PR!

If there's a particular set of commands, applications, or utilities you find useful, add an additional install mode (-m myMode).

- Create a directory with the mode's name under `src`, i.e. `src/mymode` (lowercase)  
- The entrypoint is set to $MODE_INSTALL_FILE
- A mode's entrypoint should be named `install.sh`
- `install.sh` should be located in the named mode's directory, e.g. `src/mymode`
- A mode's logic should be called from this entrypoint
- Any and all files related to a mode are to be contained in the mode's root directory, i.e. `src/mymode`
- You can use a `Brewfile` to organize and handle all resource installations (called from a mode's `install.sh`), or add individual text files for each set of apps, formulae, and casks (1 entry per line) and pass the file reference to these functions:
  - installApps
  - installFormulae
  - installCasks
- It's encourage to mimic the root directory's structure, but it's **not** required

```
├── src/mymode
       ├── Brewfile
       ├── apps.txt
       ├── casks.txt
       ├── formulae.txt
       ├── install.sh
       ├── npm.txt
       ├── taps.txt
       └── vscode.txt
```
