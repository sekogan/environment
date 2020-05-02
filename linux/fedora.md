# Fedora environment


Derived from https://github.com/ai/environment

Last tested on Fedora 32 beta.


## Switch from Wayland to X11

Log out, find gear icon and switch to Gnome in X11 mode.


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
sudo dnf update --refresh
```


## Advanced Terminal

Optionally install terminator (`sudo dnf install terminator`). Then start it and go to Preferences:

- Profiles -> default -> General:
    - font = Monospace Regular 15 (14 on desktop)
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
    - Date = false
    - Week numbers = true

Open Preferences in file manager:

- Sort folder before files = true


## Basic Visual Studio Code

Download and install Visual Studio Code.

Open preferences (Ctrl+,) and search "font size". Set font size to 20 (18 on desktop) everywhere.


## Firefox

Open Preferences in Firefox:

- General
    - Restore previous session = true
    - Default zoom = 120% (on HiDPI screen only)
- Home
    - Homepage and new windows = Firefox Home (Default)
- Search
    - Default search engine = Google
- Privacy & Security
    - Ask to save logins and passwords = false


# Chrome

Install Chrome:

```
sudo dnf install fedora-workstation-repositories
sudo dnf config-manager --set-enabled google-chrome
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

Install in Software:

- gimp
- transmission

```
sudo dnf install telegram-desktop
sudo dnf install vlc
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

Install Microsoft fonts:

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

Enable TRIM (TODO: verify that it is enabled by default since Fedora 32):

```
sudo systemctl enable fstrim.timer
```

Reduce swap usage:

```
sudo vi /etc/sysctl.d/99-swappiness.conf
```

```
vm.swappiness=1
```

Reboot and check with `cat /proc/sys/vm/swappiness`.

Settings:

- Power
    - Automatic suspend = On, When idle, 1 hour

Setup daily cleaning of unwanted files:

```
sudo vi /etc/cron.daily/clean_coredumps
sudo chmod a+x /etc/cron.daily/clean_coredumps
```

```
#!/bin/env bash

DIR=/var/lib/systemd/coredump

find $DIR/* -mtime 1 -exec rm {} \;
```


## Boot Loader

Setup grub:

```
sudo grub-set-default 0
sudo vi /etc/default/grub
```

Set grub parameters:

```
GRUB_TIMEOUT_STYLE=menu
GRUB_TIMEOUT=3
GRUB_GFXMODE=1024x768
```

Generate grub configuration:

```
sudo update-grub
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
sudo rpm -Uvh SafenetAuthenticationClient-10.7.xx-0.x86_64.rpm
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
