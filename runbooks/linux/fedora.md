# Fedora environment

Last tested on Fedora 33.


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


## Host name

Set host name:

```
sudo hostnamectl set-hostname NEW_HOSTNAME
```


## Run Ansible playbooks

```
sudo dnf install ansible

ansible-pull -U https://github.com/sekogan/environment.git -K

# If the repository is already downloaded:
ansible-playbook local.yml -K
```


## Advanced Terminal

- Profiles -> default -> General:
    - font = Monospace Regular 14 (15 on laptop)
    - copy on selection = on

Run `ibus-setup`, go to Emoji and delete keyboard shortcuts.


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
- Displays -> Night Light
    - Schedule = Manual
    - Times = 22:00 - 06:00
    - Color Temperature = 1/3
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
- Region & Language
    - Formats -> select Russian
    - Input sources -> Add Russian

Install Gnome Tweaks (in Software).

- Appearance -> Themes -> Applications -> Adwaita-dark
- Keyboard & Mouse -> Additional Layout Options
    - Switching to another layout -> Caps Lock
    - Key to choose the 3rd level -> disable Right Alt
- Top Bar
    - Activities Overview Hot Corner -> Off
    - Week Numbers -> On

Open Preferences in file manager:

- Sort folder before files = on


## Basic Visual Studio Code

Download and install Visual Studio Code.

Setup it using [this manual](../vscode.md).


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


## Git


Configure git:

```
git config --global user.name "Sergey Kogan"
git config --global user.email sekogan@gmail.com
git config --global credential.helper libsecret
```


# Environment Repo

```
mkdir ~/projects
cd ~/projects
git clone https://github.com/sekogan/environment.git
code environment
```


## OneDrive

```
sudo dnf install onedrive
mkdir -p ~/.config/onedrive
vi ~/.config/onedrive/sync_list
```

Paste:

```
/secrets
```

```
onedrive --synchronize --resync
systemctl --user enable onedrive
systemctl --user start onedrive
journalctl --user-unit=onedrive -f
```


## KeePass

Start KeePassXC. Open ~/OneDrive/secrets/kogan_secrets_v9.kdbx.


## Github access

Login into github.com in the browser.
Create a new PAT on GitHub (Avatar -> Settings -> Developer settings -> Personal access tokens
-> Generate new token).


```
cd ~/projects/environment
git push
user: sekogan
password: PAT (use special button in Github UI to copy)
```

Test that git doesn't ask password anymore:

```
git push
```

Open this file and fix encountered mishaps.


## Package managers

Optionally enable RPM Fusion repos:

```
sudo dnf config-manager --enable rpmfusion-nonfree-nvidia-driver
```


## Install essential packages

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


## Google Chrome

Open Settings:

- Passwords
    - Offer to safe = off
- Appearance
    - Page zoom = 125% (on HiDPI screen only)


## Advanced Gnome

Run Clocks and add world clocks (Yekaterinburg, UTC, Houston).

Run Weather and select Moscow.

Optionally add online accounts:

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

Install essential extensions:

- [caffeine](https://extensions.gnome.org/extension/517/caffeine/)
    - open settings and disable everything except "Show Caffeine in top panel"
- [gravatar](https://extensions.gnome.org/extension/1015/gravatar/)
    - open settings and enter email
- [hide-activities-button](https://extensions.gnome.org/extension/744/hide-activities-button/)
- [remove-alttab-delay](https://extensions.gnome.org/extension/1403/remove-alttab-delay/)
- [Guillotine](https://extensions.gnome.org/extension/3981/guillotine/)
    - `cp ~/projects/environment/runbooks/linux/fedora/.config/guillotine.json ~/.config/`
- [Primary Input on LockScreen](https://extensions.gnome.org/extension/4727/primary-input-on-lockscreen/)

Install optional extensions:

- [Hide Keyboard Layout](https://extensions.gnome.org/extension/2848/hide-keyboard-layout/)
- [autohide-battery](https://extensions.gnome.org/extension/595/autohide-battery/) (removes battery icon when on AC power)
- [bing-wallpaper-changer](https://extensions.gnome.org/extension/1262/bing-wallpaper-changer/)
- [block-caribou](https://extensions.gnome.org/extension/1326/block-caribou/) (blocks on-screen keyboard)
- [cpu-power-manager](https://extensions.gnome.org/extension/945/cpu-power-manager/)
- [hide-top-bar](https://extensions.gnome.org/extension/545/hide-top-bar/)
- [icon-hider](https://extensions.gnome.org/extension/351/icon-hider/) (removes any item from the top bar including its own icon)
- [impatience](https://extensions.gnome.org/extension/277/impatience/) (set 0.30)
- [remove-audio-device-selection-dialog](https://extensions.gnome.org/extension/1482/remove-audio-device-selection-dialog/)
- [remove-dropdown-arrows](https://extensions.gnome.org/extension/800/remove-dropdown-arrows/)
- [sound-output-device-chooser](https://extensions.gnome.org/extension/906/sound-output-device-chooser/)
- [transparent-top-bar](https://extensions.gnome.org/extension/1708/transparent-top-bar/) (makes the top bar transparent if there are no windows near it)
- [workspace-grid](https://extensions.gnome.org/extension/484/workspace-grid/)

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


Turn off automatic core dumps:

```
sudo cp ~/projects/environment/runbooks/linux/etc/50-coredump.conf /etc/sysctl.d/
sudo sysctl -p /etc/sysctl.d/50-coredump.conf
sudo rm /var/lib/systemd/coredump/*
```


## Monitoring tools

Install lm-sensors (required by freon):

```
sudo dnf install lm_sensors
sudo sensors-detect --auto
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


## Fan control on Dell laptop

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

## Fix issues with Intel Wifi

Not sure it helped, but done this so far:

`/etc/NetworkManager/conf.d/default-wifi-powersave-on.conf`

```
[connection]
wifi.powersave = 2
```

`/etc/modprobe.d/iwlwifi.conf`

```
options iwlwifi 11n_disable=8
options iwlmvm power_scheme=1
```


## Screen grabbers

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
sudo cp ~/projects/environment/certificates/kaspersky_ca/* /usr/share/pki/ca-trust-source/anchors/
sudo cp ~/projects/environment/certificates/personal_ca/ca_certificate.pem /usr/share/pki/ca-trust-source/anchors/sergei_kogan_personal_ca.pem
sudo update-ca-trust
```


## Enable weak cryptography (temporarily)

Enable weak cryptography to fix openconnect not allowing to use eToken.

```
sudo vi /etc/crypto-policies/back-ends/gnutls.config
```

```
[overrides]
# insecure-hash = SHA1
```


## VPN

Install eToken driver:

```
pushd ~/Yandex.Disk/dist/fedora/vpn/safenet
sudo rpm --import RPM-GPG-KEY-SafenetAuthenticationClient
sudo rpm -Uvh SafenetAuthenticationClient-10.7.77-1.x86_64.rpm
popd
sudo mkdir -p /etc/pkcs11/modules/
echo "module: /usr/lib64/libeTPkcs11.so" | sudo tee /etc/pkcs11/modules/eToken.module > /dev/null
```

Stop SACSrv (allegedly it starts SACMonitor which is a CPU hog):

```
sudo systemctl stop SACSrv.service
sudo systemctl disable SACSrv.service
```

Try to connect to VPN manually. Find certificate URL:

```
# p11tool --list-token-urls
pkcs11:model=eToken;manufacturer=SafeNet%2C%20Inc.;serial=01db911b;token=Sergey%20Kogan

# p11tool --list-all-certs "pkcs11:model=eToken;manufacturer=SafeNet%2C%20Inc.;serial=01db911b;token=Sergey%20Kogan"

# p11tool --login --list-privkeys pkcs11:model=eToken;manufacturer=SafeNet%2C%20Inc.;serial=01db911b;token=Sergey%20Kogan
```

Use it to connect:

```
sudo openconnect --no-proxy --certificate 'pkcs11:model=eToken;manufacturer=SafeNet%2C%20Inc.;serial=01db911b;token=Sergey%20Kogan;id=%5F%14%1D%3D%22%26%CE%68;object=le-SpecialSmartcardUserwithEncryp-63588;type=cert' --script /etc/vpnc/vpnc-script https://cvpn.kaspersky.com
```

Add VPN connection to Network Manager:

```
sudo cp ~/projects/environment/runbooks/linux/fedora/vpn/KL.nmconnection /etc/NetworkManager/system-connections/
cd /etc/NetworkManager/system-connections
sudo chown root:root KL.nmconnection
sudo chmod go-rw KL.nmconnection
sudo systemctl restart NetworkManager.service
```

VPN connection should now be visible in Settings -> Network.


## Printer

Go to Canon website and download driver for linux (google "LPB613Cdw driver").

```
tar xzvf downloaded_file.tgz
cd linux-UFRII-drv-v520-uken
sudo ./install.sh
```

Go to Settings -> Printers. Delete the printer if already exists and then add it again.
