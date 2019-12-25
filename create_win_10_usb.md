# Create Windows 10 Bootable USB

1. Install WoeUSB `https://github.com/slacka/WoeUSB`

2. Unmount device
```
udisksctl unmount --block-device /dev/sd<a,b,c><1,2,3>
```

3. Format USB as NTFS
```
sudo mkfs.ntfs /dev/sd<a,b,c><1,2,3>
```

4. Download Windows 10 ISO

5. Lauch WoeUSB and select Windows 10 ISO, select NTFS partition format and select the mount point for the usb. Install.
