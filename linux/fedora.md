# Fedora environment


Derived from [https://github.com/ai/environment](https://github.com/ai/environment)

Last tested on Fedora 32.


## Installation

Load Live CD and select "Try Fedora".

Open Settings -> Mouse & Touchpad and enable Tap to Click.

Connect to WIFI.

Open terminal.

Optionally delete previous linux bootloader:

```
sudo efibootmgr -v
sudo efibootmgr -b xxxx -B
```

Optionally remove/shrink partitions:

```
sudo dnf install gparted
sudo gparted
```

Run "Install to Hard drive".

Select custom partitioning, change "LVM" to "Standard Partition" and click "Click here to create them automatically".


## Switch from Wayland to X11

Log out, find gear icon and switch to Gnome in X11 mode.


## Basic Terminal

Open Terminal -> Preferences. Set:

- General
    - Enable the menu accelerator = off
- Profiles -> Unnamed
    - Text
        - Custom Font -> size = 14 (15 on laptop)
    - Colors
        - Use transparent background ~ 15%


## System update

```
sudo dnf update --refresh
```


## Advanced Terminal

Optionally install terminator (`sudo dnf install terminator`). Then start it and go to Preferences:

- Profiles -> default -> General:
    - font = Monospace Regular 14 (15 on laptop)
    - copy on selection = on

Run `ibus-setup`, go to Emoji and delete keyboard shortcuts.

Also install:

```
sudo dnf install vim
sudo dnf install mc
sudo dnf install ripgrep
```


## Basic Gnome

Open settings:

- Privacy
    - File History & Trash
        - Automatically Delete Trash Content = on
        - Automatically Delete Temporary Files = on
    - Screen Lock
        - Show Notifications = off
- Power
    - Automatic suspend = on
        - Plugged In = on
    - Power Button Action = suspend
- Displays -> Night Light -> 23:00 - 06:00.
- Mouse & Touchpad
    - Touchpad Speed = 75%
    - Tap to Click = on
- Keyboard Shortcuts
    - Settings = Super + I
    - Hide all normal windows = Super + D
    - Home Folder = Super + E
    - Switch windows = Alt + Tab
    - Switch applications = Super + Tab
    - Add
        - Launch terminal
        - gnome-terminal (or terminator)
        - Ctrl+Alt+T
- Region & Language -> Input sources -> Add Russian

Install Gnome Tweaks (in Software).

- Appearance -> Themes -> Applications -> Adwaita-dark
- Keyboard & Mouse -> Additional Layout Options -> Switching to another layout -> Caps Lock
- Top Bar
    - Date = off
    - Week numbers = on

Open Preferences in file manager:

- Sort folder before files = on


## Basic Visual Studio Code

Download and install Visual Studio Code.

Open settings (Ctrl+,) and search "font size". Set font size to 20 (18 on desktop) everywhere.

Install extensions (in Ctrl+P):

```
ext install ms-python.python
ext install waderyan.gitblame
ext install uloco.theme-bluloco-light
ext install CoenraadS.bracket-pair-colorizer
```

Add to settings.json:

```json
    "bracketPairColorizer.consecutivePairColors": [
        "()",
        "[]",
        "{}",
        [
            "Orange",
            "Orchid",
            "LightSkyBlue",
        ],
        "Red"
    ],
```


## Firefox

Open Preferences in Firefox:

- General
    - Restore previous session = on
    - Default zoom = 120% (on HiDPI screen only)
- Home
    - Homepage and new windows = Firefox Home (Default)
- Search
    - Default search engine = Google
- Privacy & Security
    - Ask to save logins and passwords = off


# Chrome

Install Chrome:

```
sudo dnf install fedora-workstation-repositories
sudo dnf config-manager --enable google-chrome
sudo dnf install google-chrome-stable
```

Open Settings:

- Passwords
    - Offer to safe = off
- Appearance
    - Page zoom = 125% (on HiDPI screen only)


## Git

Install git:

```
sudo dnf install git
```

Configure git:

```
git config --global user.name "Sergey Kogan"
git config --global user.email sekogan@gmail.com
```

Configure password store for git:

```
sudo dnf install git-credential-libsecret
git config --global credential.helper libsecret
```


## Github access

Login into github.com in the browser.
Create a new PAT on GitHub (Avatar -> Settings -> Developer settings -> Personal access tokens
-> Generate new token).


```
mkdir ~/projects
cd ~/projects
git clone https://github.com/sekogan/environment.git
cd environment
git push
user: sekogan
password: PAT (use special button in Github UI to copy)
```

Test that git doesn't ask password anymore:

```
git push
```

Open this file and fix encountered mishaps.


## Yandex Disk

Download and install RPM package. It will add yandex disk repository automatically.

Then run:

```
yandex-disk setup
```

Enter:

- username = skogan
- password - open Yandex Key and get one time password.


## KeePass

Install KeePassXC. Open ~/Yandex.Disk/Documents/kogan_secrets_v5.kdbx.


## Package managers

Optionally enable RPM Fusion repos:

```
sudo dnf config-manager --enable rpmfusion-nonfree-nvidia-driver
sudo dnf config-manager --enable rpmfusion-nonfree-steam
```

Optionally add RPM Fusion:

```
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

Optionally add flathub:

```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

Reboot.


## Remove unused packages

```
sudo dnf remove cheese rhythmbox orca 
```


## Install essential packages

```
sudo dnf install telegram-desktop  # requires RPM Fusion
sudo dnf install vlc  # requires RPM Fusion
sudo dnf install transmission
sudo dnf install gimp
```

Open Telegram and enable Night mode. Then go to Settings:

- Interface scale = 250% (on laptop only)
- Notifications
    - Include muted chats in unread count = off
- Advanced
    - Launch Telegram = on
    - Launch minimized = on

Sometimes telegram doesn't start. Run Tweaks and add it to startup applications.

Open VLC, go to Preferences:

- Interface:
    - Show systray icon = off
    - Pause on the last frame = on
- Hotkeys:
    - Short backward jump = Left
    - Short forward jump = Right
    - Cycle subtitle track = s
    - Cycle audio track = a

Optionally install Microsoft fonts:

```
sudo dnf install https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
```


## Advanced Gnome

Run Clocks and add world clocks (Yekaterinburg, UTC, Houston).

Run Weather and select Moscow.

Open settings:

- Online accounts -> Add Google

Remove `Ctrl+Alt+Up` and `Ctrl+Alt+Down` shortcuts:

```
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Super>Page_Up']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Super>Page_Down']"
```

Install helpers that allows to install extensions in the browser:

- Native connector:
  ```
  sudo dnf install chrome-gnome-shell
  ```
- [Firefox extension](https://addons.mozilla.org/en/firefox/addon/gnome-shell-integration/).

Install Extensions app:

```
sudo dnf install gnome-extensions-app
```

Install extensions:

- [remove-audio-device-selection-dialog](https://extensions.gnome.org/extension/1482/remove-audio-device-selection-dialog/)
- [remove-alttab-delay](https://extensions.gnome.org/extension/1403/remove-alttab-delay/)
- [autohide-battery](https://extensions.gnome.org/extension/595/autohide-battery/) (removes battery icon when on AC power)
- [transparent-top-bar](https://extensions.gnome.org/extension/1708/transparent-top-bar/) (makes the top bar transparent if there are no windows near it)
- [icon-hider](https://extensions.gnome.org/extension/351/icon-hider/) (removes any item from the top bar including its own icon)
- [bing-wallpaper-changer](https://extensions.gnome.org/extension/1262/bing-wallpaper-changer/)
- [gravatar](https://extensions.gnome.org/extension/1015/gravatar/)
- [block-caribou](https://extensions.gnome.org/extension/1326/block-caribou/) (blocks on-screen keyboard)
- [hide-activities-button](https://extensions.gnome.org/extension/744/hide-activities-button/)
- [hide-top-bar](https://extensions.gnome.org/extension/545/hide-top-bar/)
- [cpu-power-manager](https://extensions.gnome.org/extension/945/cpu-power-manager/)
- [caffeine](https://extensions.gnome.org/extension/517/caffeine/)
- [remove-dropdown-arrows](https://extensions.gnome.org/extension/800/remove-dropdown-arrows/)
- [impatience](https://extensions.gnome.org/extension/277/impatience/) (set 0.30)

Remove unwanted applications from Dock.


## System

Set host name:

```
sudo hostnamectl set-hostname xxx
```

Reduce swap usage:

```
sudo vi /etc/sysctl.d/99-swappiness.conf
```

```
vm.swappiness=1
```

Reboot and check with `cat /proc/sys/vm/swappiness`.

Setup daily cleaning of unwanted files:

```
sudo vi /etc/cron.daily/clean_coredumps
```

```
#!/bin/env bash

DIR=/var/lib/systemd/coredump

find $DIR/* -mtime 1 -exec rm {} \;
```

```
sudo chmod a+x /etc/cron.daily/clean_coredumps
```


## Boot Loader

Setup grub:

```
sudo vi /etc/default/grub
```

```
GRUB_TIMEOUT=0
```

Generate grub configuration (make sure /boot/efi/EFI/fedora/grub.cfg exist before running the command,
find the file if doesn't):

```
sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
```


## Monitoring tools

```
sudo dnf install htop
sudo dnf install iotop
sudo dnf install sysstat
sudo dnf install neofetch
sudo dnf install qdirstat
```

Install lm-sensors (required by freon):

```
sudo dnf install lm_sensors
sudo sensors-detect
```

Install [freon](https://extensions.gnome.org/extension/841/freon/).

TODO: install GPU monitoring tools: nvtop and intel gpu tools.


## Undervolting

Install undervolting tool:

```
sudo pip3 install undervolt
```

Create file:

```
sudo vi /etc/systemd/system/undervolt.service
```

```
[Unit]
Description=undervolt
After=suspend.target
After=hibernate.target
After=hybrid-sleep.target

[Service]
Type=oneshot
ExecStart=/usr/local/bin/undervolt -v --gpu -120 --core -120 --cache -120 --uncore -120 --analogio -120 -t 97

[Install]
WantedBy=multi-user.target
WantedBy=suspend.target
WantedBy=hibernate.target
WantedBy=hybrid-sleep.target
```

Check that the script works and enable service:

```
sudo systemctl enable undervolt
sudo systemctl start undervolt
```


## Fan control

NOTE: not tested in Fedora!

Disable fan controller in BIOS (Dell laptops only):

```
cd ~/projects
git clone https://github.com/TomFreudenberg/dell-bios-fan-control.git
cd dell-bios-fan-control
make
sudo ./dell-bios-fan-control 1
sudo ./dell-bios-fan-control 0
sudo cp dell-bios-fan-control /usr/local/bin
```

Create file:

```
sudo vi /etc/systemd/system/bios_fan_control.service
```

```
[Unit]
Description=undervolt
After=suspend.target
After=hibernate.target
After=hybrid-sleep.target

[Service]
Type=oneshot
ExecStart=/usr/local/bin/dell-bios-fan-control 0
ExecStop=/usr/local/bin/dell-bios-fan-control 1

[Install]
WantedBy=multi-user.target
WantedBy=suspend.target
WantedBy=hibernate.target
WantedBy=hybrid-sleep.target
```

Check that the script works and enable service:

```
sudo systemctl start bios_fan_control
sudo systemctl enable bios_fan_control
```

Install and start i8k fan control (Dell laptops only):

```
sudo dnf install i8kutils
```

Edit configuration file:

```
sudo vi /etc/i8kmon.confi8kmon
```

```
set config(poll_ac)     0
set config(poll_fans)   0
set config(0)   {{0 0}  -1  55  -1  55}
set config(1)   {{0 1}  50  60  50  60}
set config(2)   {{1 1}  55  65  55  65}
set config(3)   {{2 1}  60  70  60  70}
set config(4)   {{2 2}  65 128  65 128}
```

Patch i8kmon to fix [sound issue](https://github.com/vitorafsr/i8kutils/issues/15).

```
cd ~/projects
git clone https://github.com/sekogan/i8kutils.git
sudo mv /usr/bin/i8kmon /usr/bin/i8kmon.original
sudo cp ~/projects/i8kutils/i8kmon /usr/bin/
```

Test that it works:

```
sudo i8kmon -v
```

Enable i8kmon service:

```
sudo systemctl enable i8kmon
sudo systemctl start i8kmon
```


## Install developer tools

```
sudo dnf install meld
sudo dnf install nodejs npm yarnpkg
```


## Screen grabbers

Install flameshot:

```
sudo dnf install flameshot
```

Start and configure flameshot (`flameshot config`):

- Configuration
    - General
        - Launch at startup = off
        - Close after capture = on

Configure keyboard shortcuts:

- Go to Settings -> Keyboard Shortcuts.
- Remove Ctrl + Print shortcut.
- Add new shortcut:
    - Name: Make screenshot with flameshot
    - Command: flameshot gui
    - Shortcut: Ctrl + Print

Install peek:

```
sudo dnf install peek
sudo dnf install ffmpeg
```

Start peek, go to Preferences and enable "Open file manager after saving".

- Go to Settings -> Keyboard Shortcuts.
- Remove Ctrl + Shift + Print shortcut.
- Add new shortcut:
    - Name: Record screen with peek
    - Command: peek
    - Shortcut: Ctrl + Shift + Print


## CA certificates

Install CA certificates to the system storage:

```
sudo cp ~/projects/environment/ca/* /usr/share/pki/ca-trust-source/anchors/
sudo update-ca-trust
```


## VPN

Install eToken driver:

```
sudo dnf install nss-tools
sudo dnf install pcsc-lite
sudo dnf install gnutls-utils
pushd ~/Yandex.Disk/dist/fedora/vpn/safenet
sudo rpm --import RPM-GPG-KEY-SafenetAuthenticationClient
sudo rpm -Uvh SafenetAuthenticationClient-10.7.77-1.x86_64.rpm
popd
sudo mkdir -p /etc/pkcs11/modules/
echo "module: /usr/lib64/libeTPkcs11.so" | sudo tee /etc/pkcs11/modules/eToken.module > /dev/null
```

Install openconnect:

```
sudo dnf install openconnect
sudo dnf install vpnc-script
```

Try to connect to VPN manually. Find certificate URL:

```
# p11tool --list-token-urls
pkcs11:model=eToken;manufacturer=SafeNet%2C%20Inc.;serial=01db911b;token=Sergey%20Kogan

# p11tool --list-all-certs "pkcs11:model=eToken;manufacturer=SafeNet%2C%20Inc.;serial=01db911b;token=Sergey%20Kogan"
    ...
    URL: pkcs11:model=eToken;manufacturer=SafeNet%2C%20Inc.;serial=01db911b;token=Sergey%20Kogan;id=%18%C0%E3%0B%93%C3%A5%19;object=le-SpecialSmartcardUserwithioutEn-22619;type=cert
```

Use it to connect:

```
sudo openconnect --no-proxy --certificate 'pkcs11:model=eToken;manufacturer=SafeNet%2C%20Inc.;serial=01db911b;token=Sergey%20Kogan;id=%18%C0%E3%0B%93%C3%A5%19;object=le-SpecialSmartcardUserwithioutEn-22619;type=cert' --script /etc/vpnc/vpnc-script https://cvpn.kaspersky.com
```

Add VPN connection to Network Manager:

```
sudo dnf install NetworkManager-openconnect-gnome
sudo cp ~/projects/environment/linux/fedora/vpn/KL.nmconnection /etc/NetworkManager/system-connections/
cd /etc/NetworkManager/system-connections
sudo chown root:root KL.nmconnection
sudo chmod go-rw KL.nmconnection
sudo systemctl restart NetworkManager.service
```

VPN connection should now be visible in Settings -> Network.


## eToken in Firefox

Firefox should find eToken through p11-kit-proxy module which is loaded by default on Fedora.

Open https://cvpn.kaspersky.com/ and try to login. Should open without certificate validation errors, ask for token password and show AnyConnect Secure Mobility Client UI.


## eToken in Chrome

Open https://cvpn.kaspersky.com/ and try to login. Should open without certificate validation errors, ask for token password and show AnyConnect Secure Mobility Client UI.

Open and login to MS Teams. Should allow to do video/audio calls.


## Remote desktop clients

```
sudo dnf install remmina
```
