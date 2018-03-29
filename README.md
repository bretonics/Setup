# Setup

Automate setting up a new Mac.

```
curl https://codeload.github.com/bretonics/Setup/zip/v2.0 -o Setup.zip
unzip Setup.zip
cd Setup
sh install.sh
```

Customize
---
Files in [src](https://github.com/bretonics/Setup/tree/master/src) keep track of the programs to install. Modify the [apps.txt](https://github.com/bretonics/Setup/blob/master/src/apps.txt), [formulae.txt](https://github.com/bretonics/Setup/blob/master/src/formulae.txt), and  [casks.txt](https://github.com/bretonics/Setup/blob/master/src/casks.txt) files containing a list of apps and their respective Mac App Store product identifiers, formula, and casks that you want installed before running `sh install.sh`.

Secondary
---
Secondary install sets up personalized Mac settings, and is run after `sh install.sh`.

```
sh secondary.sh
```
