[![CI](https://github.com/sekogan/environment/workflows/CI/badge.svg)](https://github.com/sekogan/environment/actions)

# Personal Environment

This repository contains instructions, scripts and resources required to recreate my personal
computing environment.

Inspired by [https://github.com/ai/environment](https://github.com/ai/environment).


## Usage

### On Linux (Fedora)

[Use Fedora runbook](runbooks/linux/fedora.md).


## Testing

Install required packages:

```
sudo dnf install vagrant vagrant-libvirt libvirt qemu
sudo pip install molecule molecule-vagrant python-vagrant yamllint ansible-lint
```

Run tests:

```
cd ~/projects/environment
molecule test
```
