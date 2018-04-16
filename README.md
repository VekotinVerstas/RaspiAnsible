# Automated software install to Raspbian Stretch

This repository contains Ansible-playbooks for automatically
install and configure various application combinations on
Raspberry pi 3 computer.

## Usage


Copy your ssh public key to Raspi manually or using ssh-copy-id:

`ssh-copy-id pi@10.255.255.100`

Then change the default password `raspberry`.

Run ansible-playbook on remote Raspi using command:

```
ansible-playbook -i '10.255.255.100,' -u pi init.yml \
  --extra-vars "hostname=uniqhost ap_ssid=SSID ap_passphrase=PASS" \
  --tags "i2ssound"
```

# Variables

All extra-vars and tags are not mandatory in all cases.

## Mandatory
 * hostname - unique hostname for this Raspi

## Tags

### init
Install basic apps to make Raspibian usable.

### accesspoint
Install stuff needed to activate WLAN access point

Extra-vars
 * ap_ssid - WLAN AP name
 * ap_passphrase - wpa2 password for AP

### camera
Enable camera module.

### i2ssound
Install and compile software to enable I2S MEMS microphone.
Instructions are from [Adafruit's web page](https://learn.adafruit.com/adafruit-i2s-mems-microphone-breakout?view=all)
