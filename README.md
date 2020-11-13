# Automated software install to Raspbian Stretch

This repository contains Ansible-playbooks for automatically
install and configure various application combinations on
Raspberry Pi 3 or 4 computer and Raspberry Pi OS 2020-08-20.

## Usage

Copy your ssh public key to Raspi manually or using ssh-copy-id:

`ssh-copy-id pi@10.255.255.100`

Then log in and change the default password `raspberry`.

## Basic installation

Run ansible-playbook on remote Raspi using command below. 
Without `-k` flag you must have your ssh id copied into user pi's account as shown above.

```
ansible-playbook -i '10.255.255.100,' -u pi init.yml --extra-vars "hostname=newraspi.local" --tags "init"

```
Notice `--extra-vars` flag. It contains different variables for different functionalities.

If `--tags` flag contains comma separated list of tags, only single tasks labeled 
with those tags will be executed.

It might be a good idea to install different functionalities one by one when furnishing a new Raspi. 

# Variables

All extra-vars and tags are not mandatory in all cases.

## Mandatory
 * hostname - unique hostname for this Raspi

## Tags

### init
Install basic apps to make Raspibian usable.

`--extra-vars "hostname=newraspi.local" --tags "init"`

### accesspoint
Install stuff needed to activate WLAN access point

Extra-vars
 * ap_ssid - WLAN AP name
 * ap_passphrase - wpa2 password for AP
 
Use

`--extra-vars "hostname=newraspi.local ap_ssid=SSID ap_passphrase=PASS" --tags "accesspoint"`

### reversessh

Install reverse ssh tunnel using autossh

Extra-vars
 * sshport - port to use in remote host. This must be unique for all Raspis
 * sshhost - remote host to connect
 
Use

`--extra-vars "sshport=6543 sshhost=server.example.com" --tags "reversessh"`

After installation of reversessh you must manually
* ensure remote host has a retricted user `pi` for ssh connections
* add key `/root/.ssh/id_ed25519_nopw.pub` to user `pi`'s `/home/pi/.ssh/authorized_keys`
* try that connection works with command  
  `sudo ssh -i /root/.ssh/id_ed25519_nopw pi@server.example.com`
* reboot Raspberry Pi and after it has booted up, try reverse ssh connection from remote
host using command  
`ssh pi@localhost -p 6543`

### camera
Enable camera module.

Use

`--tags "camera"`

### i2ssound
Install and compile software to enable I2S MEMS microphone.
Instructions are from [Adafruit's web page](https://learn.adafruit.com/adafruit-i2s-mems-microphone-breakout?view=all)

Use

`--tags "i2ssound"`

### nbiothat
Enable some NB-IoT HATs.

Use

`--tags "i2c,nbiothat"`
