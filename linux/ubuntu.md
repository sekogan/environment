# Ubuntu environment


Derived from https://github.com/ai/environment

Last tested on Ubuntu 20.04.


## Basic Terminal

Open Terminal -> Preferences. Set:

- General
    - Enable the menu accelerator = off
- Profiles -> Unnamed
    - Text
        - Custom Font -> size = 15 (14 on desktop)
    - Colors
        - Use transparent background = 15%


## System update

```
sudo apt update
sudo apt upgrade
```


## Advanced Terminal

Optionally install terminator (`sudo apt install terminator`). Then start it and go to Preferences:

- Profiles -> default -> General:
    - font = Ubuntu Mono regular 18
    - copy on selection = on

Run `ibus-setup`, go to Emoji and delete keyboard shortcuts.

Also install:

```
sudo apt install vim
sudo apt install mc
sudo apt install ripgrep
```


## Basic Gnome

Open settings:

- Appearance
    - Window colors = Dark
    - Auto-hide the Dock = true
- Privacy
    - File History & Trash
        - Automatically Delete Trash Content = true
        - Automatically Delete Temporary Files = true
    - Screen Lock
        - Show Notifications = false
- Power
    - Automatic suspend = on
        - Plugged In = on
    - Power Button Action = suspend
- Displays -> Night Light -> 23:00 - 06:00.
- Mouse & Touchpad -> Touchpad Speed = 75%
- Keyboard Shortcuts
    - Settings = Super + I
    - Hide all normal windows = Super + D
    - Home Folder = Super + E
    - Unset "Launch terminal"
    - Optionally add
        - Launch terminal
        - terminator
        - Ctrl+Alt+T
- Region & Language -> Input sources -> Add Russian

Install Gnome Tweaks (in Software).

- Appearance -> Themes -> Applications -> Adwaita-dark
- Extensions -> Desktop icons -> Remove all icons
- Keyboard & Mouse -> Additional Layout Options -> Switching to another layout -> Caps Lock
- Top Bar
    - Date = false
    - Week numbers = true
- Window Titlebars
    - Minimize = false
    - Maximize = false


## Basic Visual Studio Code

Download and install Visual Studio Code.

Open preferences (Ctrl+,) and search "font size". Set font size to 20 (18 on desktop) everywhere.


## Firefox

Open Preferences in Firefox:

- General
    - Restore previous session = true
    - Default zoom = 120% (on HiDPI screen only)
- Privacy & Security
    - Ask to save logins and passwords = false


# Chrome

Open Settings:

- Passwords
    - Offer to safe = off
- Appearance
    - Page zoom = 125% (on HiDPI screen only)


## Git

Install git:

```
sudo apt install git
```

Configure git:

```
git config --global user.name "Sergey Kogan"
git config --global user.email sekogan@gmail.com
```

Configure password store for git:

```
sudo apt-get install libsecret-1-0 libsecret-1-dev make gcc
cd /usr/share/doc/git/contrib/credential/libsecret
sudo make
git config --global credential.helper /usr/share/doc/git/contrib/credential/libsecret/git-credential-libsecret
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


## Yandex Disk

Download and install DEB package. It will add yandex disk repository automatically.

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

Optionally install flatpak.

```
sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
reboot
```


## Install essential packages

Install in Software:

- gimp
- transmission

```
sudo apt install net-tools
sudo apt install curl
sudo apt install telegram-desktop
sudo apt install vlc
```

Open telegram, enable Night mode. Then go to Settings -> Advanced:
- Launch Telegram = true
- Launch minimized = true

Open VLC, go to Preferences:

- Interface:
    - Show systray icon = false
    - Pause on the last frame = true
- Hotkeys:
    - Short backward jump = Left
    - Short forward jump = Right
    - Cycle subtitle track = s
    - Cycle audio track = a


## Advanced Gnome

Install Clocks

```
sudo apt-get install gnome-clocks
```


Add world clocks (Yekaterinburg, UTC, Houston).

Install Weather and select Moscow.

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
  sudo apt install chrome-gnome-shell
  ```
- [Firefox extension](https://addons.mozilla.org/en/firefox/addon/gnome-shell-integration/).

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

Reduce swap usage:

```
sudo vi /etc/sysctl.d/99-swappiness.conf
```

```
vm.swappiness=1
```

Reboot and check with `cat /proc/sys/vm/swappiness`.


## TTY consoles

On HiDPI screen:

```
sudo dpkg-reconfigure console-setup
```

Select UTF-8 -> Guess -> Terminus -> 16x32.


## Boot Loader

Setup grub:

```
sudo vi /etc/default/grub
```

Set grub parameters:

```
GRUB_TIMEOUT_STYLE=menu
GRUB_TIMEOUT=3
GRUB_CMDLINE_LINUX="fbcon=font:TER16x32"
<!-- GRUB_GFXMODE=1024x768 -->
```

Generate grub configuration:

```
sudo update-grub
```

## Monitoring tools

```
sudo apt install htop
sudo apt install iotop
sudo apt install sysstat
sudo apt install neofetch
sudo apt install qdirstat
```

Install lm-sensors (required by freon):

```
sudo apt install lm-sensors
sudo sensors-detect
```

Install [freon](https://extensions.gnome.org/extension/841/freon/).

Install GPU monitoring tools:

```
sudo apt install nvtop
sudo apt install intel-gpu-tools
```


## Undervolting and fan control

Install undervolting tool:

```
sudo apt install python3-pip
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
ExecStart=/usr/local/bin/undervolt -v --gpu -120 --core -120 --cache -120 --uncore -120 --analogio -120 -t 95

[Install]
WantedBy=multi-user.target
WantedBy=suspend.target
WantedBy=hibernate.target
WantedBy=hybrid-sleep.target
```

Check that the script works and enable service:

```
sudo systemctl start undervolt
sudo systemctl enable undervolt
```

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
sudo apt install i8kutils
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
sudo apt install meld
sudo apt install nodejs npm yarn
```


## Screen grabbers

Install flameshot:

```
sudo apt install flameshot
```

Start and configure flameshot:

- Configuration
    - General
        - Launch at startup = false
        - Close after capture = true

Configure keyboard shortcuts:

- Go to Settings -> Keyboard Shortcuts.
- Remove Ctrl + Print shortcut.
- Add new shortcut:
    - Name: Make screenshot with flameshot
    - Command: flameshot gui
    - Shortcut: Ctrl + Print

Install peek:

```
sudo apt install peek
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
sudo cp ~/projects/environment/ca/* /usr/local/share/ca-certificates/
sudo update-ca-certificates
```

Install CA certificates to the shared NSS database.

NOTE: applications from snaps or flatpaks don't have access to the shared NSS database.
Firefox doesn't use shared database either, it has its own database.

Open Chrome. Verify it has created `~/.pki/nssdb`. Close Chrome.

Add CA certificates to the database:

```
for file in ~/projects/environment/ca/* ; do certutil -d sql:$HOME/.pki/nssdb/ -A -t "CT,," -n "$(basename -- "$file")" -i "$file" ; done
```

Verify they were added using

```
certutil -d sql:$HOME/.pki/nssdb -L
```


## VPN

Install eToken driver:

```
sudo apt install libnss3-tools
sudo apt install gnutls-bin libengine-pkcs11-openssl opensc
sudo dpkg -i ~/Yandex.Disk/dist/ubuntu/vpn/safenet/safenetauthenticationclient_10.7.77_amd64.deb
sudo mkdir -p /etc/pkcs11/modules/
echo "module: /usr/lib/libeTPkcs11.so" |sudo tee /etc/pkcs11/modules/eToken.module >/dev/null
```

Install openconnect:

```
sudo apt install openconnect
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
sudo openconnect --no-proxy --certificate 'pkcs11:model=eToken;manufacturer=SafeNet%2C%20Inc.;serial=01db911b;token=Sergey%20Kogan;id=%18%C0%E3%0B%93%C3%A5%19;object=le-SpecialSmartcardUserwithioutEn-22619;type=cert' --script /usr/share/vpnc-scripts/vpnc-script https://cvpn.kaspersky.com
```

Add VPN connection to Network Manager:

```
sudo apt install network-manager-openconnect-gnome
sudo cp ~/projects/environment/linux/ubuntu/vpn/KL.nmconnection /etc/NetworkManager/system-connections/
cd /etc/NetworkManager/system-connections
sudo chown root:root KL.nmconnection
sudo chmod go-rw KL.nmconnection
sudo systemctl restart NetworkManager.service
```

VPN connection should now be visible in Settings -> Network.


## eToken in Firefox

Install CA certificates. Open Firefox and go to Preferences -> Privacy & Security -> Security -> Certificates -> View Certificates -> Authorities -> Import. Import certs from ~/project/environment/ca.

Open Preferences -> Privacy & Security -> Security -> Certificates -> Security Devices. Press "Load" and enter "SafeNet eToken" and `/usr/lib/libeTPkcs11.so`.

Open https://cvpn.kaspersky.com/ and try to login. Should open without certificate validation errors, ask for token password and show AnyConnect Secure Mobility Client UI.


## eToken in Chrome

Open https://cvpn.kaspersky.com/. It should open without certificate validation errors.

Add token module to $HOME/.pki/nssdb (close all running browsers first):

```
modutil -dbdir sql:$HOME/.pki/nssdb/ -add "eToken" -libfile /usr/lib/libeTPkcs11.so
```

Check everything is OK:

```
# List tokens. Should show eToken.
modutil -dbdir sql:$HOME/.pki/nssdb/ -list
# List tokens. Should show eToken.
certutil -U -d sql:$HOME/.pki/nssdb/
# List certificates. Should ask for password and print CA and personal certificates
certutil -L -d sql:$HOME/.pki/nssdb/ -h all
```

Open https://cvpn.kaspersky.com/ and try to login. Should open without certificate validation errors, ask for token password and show AnyConnect Secure Mobility Client UI.

Open MS Teams. Should login and allow to do video/audio calls.


## Remote desktop clients

```
sudo apt install remmina
```
