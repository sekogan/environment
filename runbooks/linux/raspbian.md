# Raspbian OS


## OS

Download Raspbian OS Lite and write it to flash card.

Mount /boot partition and create empty `ssh` file in its root directory.

Connect Ethernet and power to the Raspberry PI.

Connect to it using ssh (password: raspberry).

```
ssh pi@1.2.3.4
```

Change default password:

```
passwd
```

Run:

```
sudo raspi-config
```

Configure:

- Localisation
    - locale
    - time zone
    - WLAN country
- Performance
    - GPU memory = 16

Update OS

```
sudo apt-get update
sudo apt-get upgrade
sudo reboot
```

Uninstall pulseaudio:

```
sudo apt purge "pulseaudio*"
```

```
adduser skogan
sudo usermod -a -G sudo,users,ssh skogan
```

Install basic utilities:

```
sudo apt install vim
sudo apt install mc
```

Install system utilities:

```
sudo apt install stress s-tui
sudo apt install btrfs-progs
```

Install developer utilities:

```
sudo apt install git
```

Install OpenMediaVault:

```
wget -O - https://github.com/OpenMediaVault-Plugin-Developers/installScript/raw/master/install | sudo bash
```

Login to OMV (admin, openmediavault).


Download, build and install snapraid.



## Filesystems

```
# create parity filesystem
sudo mkfs.ext4 -m 0 -T largefile4 -L parity1 /dev/xxx

# create data filesystem
sudo mkfs.btrfs -L unsorted /dev/sde2
```


## Hd-idle

```
sudo apt install hd-idle
```

```
sudo vi /etc/defaults/hd-idle
```

Comment out existing HD_IDLE_OPTS and add:

```
HD_IDLE_OPTS="-i 0 -a /dev/sda -i 3600 -a /dev/sdb -i 3610 -a /dev/sdc -i 3620 -a /dev/sdd -i 3630 -a /dev/sde -i 3640 -a /dev/sdf -i 3650 -a /dev/sdg -i 3660 -a /dev/sdh -i 3670"
```

Set OMV disk settings to:

- APM = 192
- AAM = Disabled
- Spindown = Disabled

```
sudo systemctl restart hd-idle
sudo systemctl enable hd-idle
```
