# Ubuntu environment


Derived from https://github.com/ai/environment


## Basic Terminal

Open Terminal -> Preferences. Set:

- General/Enable the menu accelerator -> Off
- Profiles/Unnamed/
    - Text
        - Custom Font -> size = 15
    - Colors
        - Use transparent background = 15%


## System update

```
sudo dnf update --refresh
```


## Advanced Terminal

Install terminator (`sudo apt install terminator`). Then start it and go to Preferences:

- Profiles -> default -> General:
    - font = Ubuntu Mono regular 18
    - copy on selection -> on

Run `ibus-setup`, go to Emoji and delete keyboard shortcuts.

Also install:

```
sudo apt install vim
sudo apt install mc
sudo apt install htop
sudo apt install ripgrep
cargo install exa
sudo apt install neofetch
sudo apt install qdirstat
```


## Basic Gnome

Open settings:

- Dock -> Auto-hide the Dock = on
- Region & Language -> Input sources -> Add Russian
- Power -> Power Button Action = Suspend
- Devices -> Displays -> Night Light -> 23:00 - 06:00.
- Devices -> Keyboard Shortcuts
    - Settings = Super + I
    - Hide all normal windows = Super + D
    - Unset "Launch terminal"
    - Add
        - Launch terminator
        - terminator
        - Ctrl+Alt+T
    - Add
        - Files
        - nautilus
        - Super + E
- Mouse & Touchpad -> Touchpad Speed = 75%

Install Gnome Tweaks (in Software).

- Appearance -> Themes -> Applications -> Adwaita-dark
- Extensions -> Desktop icons -> Remove all
- Keyboard & Mouse -> Additional Layout Options -> Switching to another layout -> Caps Lock
- Top Bar
    - Date = false
    - Week numbers = true
- Window Titlebars
    - Minimize = false
    - Maximize = false

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
TODO: find a package like in Fedora that installs libsecret

```
sudo apt-get install libsecret-1-0 libsecret-1-dev
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
user: sekogan
password: PAT (use special button in Github UI to copy)
```

Test that git doesn't ask password anymore:

```
cd notes
git pull
git pull
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
- chrome

```
sudo apt install net-tools
sudo apt install curl
sudo apt install telegram
sudo apt install vlc
```

Open telegram, enable Night mode.
Add telegram to GNOME tweaks -> Startup Applications.

Open VLC, go to Preferences:

- Interface:
    - Show systray icon = false
    - Pause on the last frame = true
- Hotkeys:
    - Short backward jump = Left
    - Short forward jump = Right


## Advanced Gnome

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
- [remove-dropdown-arrows](https://extensions.gnome.org/extension/800/remove-dropdown-arrows/) (removes dropdown arrows from the top bar)
- [autohide-battery](https://extensions.gnome.org/extension/595/autohide-battery/) (removes battery icon when on AC power)
- [transparent-top-bar](https://extensions.gnome.org/extension/1708/transparent-top-bar/) (makes the top bar transparent if there are no windows near it)
- [icon-hider](https://extensions.gnome.org/extension/351/icon-hider/) (removes any item from the top bar including its own icon)
- [bing-wallpaper-changer](https://extensions.gnome.org/extension/1262/bing-wallpaper-changer/)
- [gravatar](https://extensions.gnome.org/extension/1015/gravatar/)
- [block-caribou](https://extensions.gnome.org/extension/1326/block-caribou/) (blocks on-screen keyboard)

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

Settings:

- Power
    - Automatic suspend = On, When idle, 1 hour


## Boot Loader

Setup grub:

```
sudo grub-set-default 0
sudo vi /etc/default/grub
```

Set grub parameters:

```
GRUB_DEFAULT=saved
GRUB_TIMEOUT_STYLE=menu
GRUB_TIMEOUT=3
GRUB_GFXMODE=1024x768
```

Generate grub configuration:

```
sudo update-grub
```


## Undervolting and monitoring tools (WIP)

Install lm-sensors (required by freon):

```
sudo apt install lm-sensors
sudo sensors-detect
```

Install [freon](https://extensions.gnome.org/extension/841/freon/).


```
sudo apt install python3-pip
pip3 install undervolt

```

TODO: check that .local/bin is not added to PATH in .bashrc
Add ~/.local/bin to $PATH, add to ~/.profile:

```
PATH="$HOME/.local/bin:$PATH"
```

To be continued


## Install developer tools

```
sudo apt install meld
sudo apt install nodejs npm yarn
```


## Productivity tools

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

- Go to Gnome Settings -> Devices -> Keyboard Shortcuts.
- Remove Ctrl + Print shortcut.
- Add new shortcut:
    - Name: Make screenshot with flameshot
    - Command: flameshot gui
    - Shortcut: Ctrl + Print

Install peek:

```
sudo add-apt-repository ppa:peek-developers/stable
sudo apt update
sudo apt install peek
```

Start peek, go to Preferences and enable "Open file manager after saving".

- Go to Gnome Settings -> Devices -> Keyboard Shortcuts.
- Remove Ctrl + Shift + Print shortcut.
- Add new shortcut:
    - Name: Record screen with peek
    - Command: peek
    - Shortcut: Ctrl + Shift + Print


## VPN

NOTE: Try to install nss-tools first. It greatly simplified the installation on Fedora.

Install eToken driver:

```
sudo apt install gnutls-bin libengine-pkcs11-openssl opensc
sudo dpkg -i ~/Yandex.Disk/dist/ubuntu/vpn/safenet/safenetauthenticationclient_10.7.77_amd64.deb
sudo mkdir -p /etc/pkcs11/modules/
sudo echo "module: /usr/lib/libeTPkcs11.so" > /etc/pkcs11/modules/eToken.module
```

Install CA certificates:

```
cp ~/projects/environment/ca/* /usr/local/share/ca-certificates/
sudo update-ca-certificates
```

Install openconnect:

```
sudo apt install openconnect
```

Try to connect to VPN manually:

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

- Install CA certificates. Open Firefix and go to Preferences -> Privacy & Security -> Security -> Certificates -> View Certificates -> Authorities -> Import. Import certs from ../ca.

Open https://cvpn.kaspersky.com/. It should be opened without certificate validation errors.

Open Preferences -> Privacy & Security -> Security -> Certificates -> Security Devices. Press "Load" and select `/usr/lib/libeTPkcs11.so`.

Restart the browser.

Open https://cvpn.kaspersky.com/ and try to login (press Logon button if it fails). Should ask for password and show AnyConnect Secure Mobility Client UI.


## eToken in Chrome

Install Chrome.

Install CA certificates. Open Chrome and go to Settings -> Search settings -> type cert -> Manage certificates -> Authorities -> Import. Import certs from ../ca.

Open https://cvpn.kaspersky.com/. It should be opened without certificate validation errors.

Add token module to ~/.pki/nssdb (close all running browsers first):

```
sudo apt install libnss3-tools
modutil -dbdir sql:.pki/nssdb/ -add "eToken" -libfile /usr/lib/libeTPkcs11.so
```

Check everything is OK:

```
# List tokens. Should show eToken.
modutil -dbdir sql:.pki/nssdb/ -list
# List tokens. Should show eToken.
certutil -U -d sql:.pki/nssdb/
# List certificates. Should ask for password and print CA and personal certificates
certutil -L -d sql:.pki/nssdb/ -h all
```

Run Chrome (doesn't work in Chromium right now). Go to Settings -> Search settings -> type cert -> Manage certificates -> Your certificates. Should ask for password and show token certificates.

Open https://cvpn.kaspersky.com/ and try to login (press Logon button if it fails). Should ask for password and show AnyConnect Secure Mobility Client UI.

Open MS Teams. Should login and allow to do video/audio calls.


## Remote desktop clients

TODO: this part is not verified

```
sudo apt install remmina
sudo apt install freerdp
```

Allow freerdp and remmina to grab keyboard in x11 mode:

```
gsettings set org.gnome.mutter.wayland xwayland-grab-access-rules "['xfreerdp', 'org.remmina.Remmina']"
```

Remmina 1.4.1 doesn't grab keyboard in wayland mode. To solve this it has to be started in x11 mode.
Add to ~/.bashrc:

```
alias remmina="GDK_BACKEND=x11 nohup remmina &>/dev/null &"
```

Also add:

```
alias rdp="nohup xfreerdp /v:kogan.avp.ru /d:avp.ru /u:Kogan +compression +fonts +window-drag /f &>/dev/null &"
```
