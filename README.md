# hidmet-kde-plasmoid

KDE Plasma6 weather plasmoid for hidmet.gov.rs

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
mkdir build && cd build/
cmake ../
make install

systemctl restart --user plasma-plasmashell.service
```

This installs plasmoid to user's plasmoids directory - `~/.local/share/plasma/plasmoids/`, and restarts Plasma shell so that plasmoid is available to add
