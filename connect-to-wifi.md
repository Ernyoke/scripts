# Connect to Wifi Network

1. Check if Wifi connection is enabled

`nmcli radio`

2. If the Wifi is not enable, try to enable it

`nmcli radio wifi on`

3. Scan for available hot-spots

`nmcli device wifi rescan`

4. List hot-spots

`nmcli device wifi list`

5. Connect to a hotspot

`nmcli device wifi connect [SSID-Name] password [wireless-password]`
