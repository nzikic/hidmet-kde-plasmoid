# hidmet-kde-plasmoid

KDE Plasma5 weather plasmoid for hidmet.gov.rs

*Plasmoid is still in development phase.*

## Installation instructions

### Install

If you want to install plasmoid run following commands in the console:

```bash
cd hidmet-kde-plasmoid/
kpackagetool5 --type Plasma/Applet --install plasmoid/
```
Command above installs plasmoid to user's directory at `~/.local/share/plasma/plasmoids/` directory.
To install it globally into `/usr/share/plasma/plasmoids/` add `--global` option.
```bash
kpackagetool5 --type Plasma/Applet --global --install plasmoid/
```

### Upgrade

If you already have this plasmoid installed, to upgrade use:

```bash
kpackagetool5 --type Plasma/Applet --upgrade plasmoid/
```

### Remove
To **remove** it:
```bash
kpackagetool5 --type Plasma/Applet --remove plasmoid/
```
