# Ansible for Ham Radio
This repo contains some ansible tasks to setup/update linux hosts mainly for ham radio digital modes.  

If you are familiar with ansible you could setup an inventory file and assign one or more more of the included roles.  
I have included a simple wrapper script to deploy to the specified host without setting up an inventory.  

This ansible repo was developed on a Debain 13 machine and tested on Debian 13 x86 and aarch64 targets including Raspberry Pi 4 running Raspberry Pi OS 64-Bit.  

I created this to be able to quickly setup a new or upgraded machine for ham radio digital modes.  
This is particularly helpful for Raspberry Pi OS as they recommend that you re-flash/re-install the OS for major version upgrades.

## Quickstart
First, make sure you can ssh (ideally with a pubkey instead of password) to the target host.
```bash
# apt install only needed on where you will run commands, not needed on the target host.
sudo apt install ansible-core

./run-one-host.sh HOSTNAME ham YOURCALL
```
When it asks for `BECOME password` you should input the user password for the target machine or just hit enter if your user on the remote machine has passwordless sudo.  
Replace HOSTNAME with the target machine, or localhost for the current machine you are on.  
Replace YOURCALL with your callsign.  
If you change the "ham" argument you can change which set of packages you would like to install.

## Sample Ansible commands
Use commands like this if you are more familiar with ansible, otherwise just use the `run-one-host.sh` script.  
`ansible-playbook ham.yaml -i inventory.ini --ask-become-pass -e "callsign=YOURCALL"`  
`ansible-playbook remote-access.yaml -i inventory.ini --ask-become-pass`

## What's included in the Ansible Plays
### ham
The ham play installs:  
- [Pat](https://getpat.io/) - for winlink
- wjstx
- js8call
- fldigi, flrig, flmsg
- gpsd-tools, gpsd-clients
- wwl (Maidenhead locator utility)
- [FlexPacket](https://github.com/andreaspeters/flexpacket) - packet radio client
- SDR++
- [kappanhang](https://github.com/nonoo/kappanhang) - enables digital modes on IC-705 via wifi. 

Also creates the  file `/etc/ax25/axports` with contents
```
wl2k YOURCALL 9600 255 7 Winlink
```
### remote-access
Installs Rustdesk from github

### keyboard
installs [vial](https://get.vial.today/) from github
