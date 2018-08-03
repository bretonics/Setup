# Setup

Automate setting up a new Mac.

```
curl https://raw.githubusercontent.com/bretonics/Setup/master/setup.sh | bash
```

Customize
---
Files in [src](https://github.com/bretonics/Setup/tree/master/src) keep track of the programs to install.

1. Cancel auto run with `Ctrl-C` to modify the [apps.txt](https://github.com/bretonics/Setup/blob/master/src/apps.txt), [formulae.txt](https://github.com/bretonics/Setup/blob/master/src/formulae.txt), and [casks.txt](https://github.com/bretonics/Setup/blob/master/src/casks.txt) files containing a list of apps and their respective Mac App Store product identifiers, formula, and casks that you want installed.

2. Run `sh install.sh`.

Secondary
---
Secondary install sets up personalized Mac settings, and is run after `sh install.sh`.

```
sh secondary.sh
```
