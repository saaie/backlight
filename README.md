# Backlight brightness
This small project is about fixing function+brightness keys for increase or decrease brightness of laptops that are using two graphic cards and "gsd-backlight-helper" can only change one of them brightness. Then this 
may cause a problem that your fn+brightness keys are working(gnome brightness slide shows) but brightness not changed.

# Prerequisite
Before using this codes, you should fix fn+brightness keys problems with your distribution. You can google and find solutions about this problem, but if your notebook/laptop is Asus, add "acpi_osi=" to grub boot 
command line(/etc/default/grub). Find line below in the file and add "acpi_osi=" to that. 
GRUB_CMDLINE_LINUX_DEFAULT="acpi_osi= quiet ..." 

After that use "grub-mkconfig -o /boot/grub/grub.cfg" to apply changes.

# installation
Download project's files and copy 50-backlight.rules file to /etc/udev/rules.d/ directory. Then copy intelbacklight.sh file to /usr/sbin/ directory. Then run command `chmod +x /usr/sbin/intelbacklight.sh` in terminal.
The installation completed. Test and enjoy it.

# license
This project release with GPLv3 license. 

