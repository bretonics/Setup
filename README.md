# Setup

Automate setting up a new Mac.

```
curl -O https://raw.githubusercontent.com/bretonics/Setup/master/install.sh
sh install.sh
```

Customize
---
Add the Mac App Store product identifiers to `apps=""` (separated by a space) that you want to install before running `sh install.sh`. The [apps.txt](https://github.com/bretonics/Setup/blob/master/src/apps.txt) file contains a list of apps and their respective Mac App Store product identifiers. Use [formulae.txt](https://github.com/bretonics/Setup/blob/master/src/formulae.txt) and  [casks.txt](https://github.com/bretonics/Setup/blob/master/src/casks.txt) to do the same in `formulae=""` and `casks=""`, respectively.

Secondary
---
Secondary install sets up personalized Mac settings, and is run after `sh install.sh`.

```
sh secondary.sh
```
