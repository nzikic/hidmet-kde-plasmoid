
Bla, bla, bla

# hidmet-kde-plasmoid

KDE Plasma5 weather plasmoid for hidmet.gov.rs

*Plasmoid is still in development phase.*

Plasmoid shows the current temperature  weather conditions for various places in Serbia. <br>
The data is taken from RSS feed of [Republic Hidrometeorological Service of Serbia](http://www.hidmet.gov.rs/ "Републички Хидрометеоролошки завод"). <br>
Weather forecast is currently not implemented, because RSS feed only gives current data.

Плазмоид показује тренутну температуру и временске услове за различита места у Србији. <br>
Подаци се узимају са RSS feed-а [Републичког хидрометеоролошког завода](http://www.hidmet.gov.rs/ "Републички Хидрометеоролошки завод").<br>
Временска прогноза тренутно није имплементирана, јер RSS feed даје само актуелне податке.

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
