# My Own Arch Installation

###### Check if your boot with UEFI

```shell
ls /sys/firmware/efi/efivars
```

###### Check internet conection

```shell
ping -c 4 archlinux.org
```

###### Update system clock

```shell
date && timedatectl set-ntp true && date
```



###### Partitioning disk

```shell
cfdisk
```

Select the partition table type (recommended GPT)  (If the disk has a partition table, this don't appear)

###### Partition table example

| Device    | Size                  | Type             |
| --------- | --------------------- | ---------------- |
| /dev/sdx1 | 550M                  | EFI              |
| /dev/sdx2 | 2xRAM                 | SWAP             |
| /dev/sdx3 | Resto (Al menos 20GB) | Linux filesystem |

When finish, select `Write`



###### Formatting partitions created

```shell
# EFI
mkfs.fat -F32 /dev/sdx1

# SWAP
mkswap /dev/sdx2
swapon /dev/sdx2

# Root
mkfs.ext4 /dev/sdx3
```

###### Mount filesystem

```shell
# Root
mount /dev/sdx3 /mnt

# Efi
mkdir /mnt/boot/efi -p
mount /dev/sdx1 /mnt/boot/efi
```



###### Add custom repo to mirrorlist

```shell
nano /etc/pacman.d/mirrorlist
```

Comment all, and put (this only in Cuba)

```
Server = http://repos.uo.edu.cu/archlinux/$repo/os/$arch
```



###### Install base packages

```shell
pacstrap /mnt base base-devel linux linux-firmware vim git
```



###### Generate filesystem tab

```shell
genfstab -U /mnt >> /mnt/etc/fstab
```



###### Change root path

```shell
arch-chroot /mnt
```



###### Configure timezone

```shell
ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
hwclock --systohc && date
```

Example: America/Havana



###### Configure language

```shell
locale-gen
echo LANG=lang_Country.UTF-8 > /etc/locale.conf
```

- Spanish: es_ES
- English: en_US or en_UK



###### Configure hostname

```shell
echo your_hostname > /etc/hostname
```

###### Configure hosts

```shell
vim /etc/hosts

# Cread existing comments and put
127.0.0.1	localhost your_hostname
::1			localhost
```



###### Install and enable NetworkManager

Configure custom repo server again

```shell
pacman -S networkmanager
systemctl enable NetworkManager
```



###### Set a root password

```shell
passwd
```



###### Configure bootloader

```shell
pacman -S grub efibootmgr os-prober
grub-install --target=x86_64-efi --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg
```



###### Reboot

```shell
exit
umount -R /mnt
reboot
```



##### Login as root and follow next steps



###### Add your user

```shell
useradd -m user_name
passwd user_name
```



###### Configure sudoers

```
vim /etc/sudoers

#---------------------------------#
# Configure vim as default editor #
#---------------------------------#
# Reset environment by default
Defaults	env_reset
# Set default EDITOR to vim, and do not allow visudo to use EDITOR/VISUAL
Defaults	editor=/usr/bin/vim, !env_editor

#----------------------------------#
# Allow wheel group access to sudo #
#----------------------------------#
%wheel	ALL=(ALL) ALL
```

For to save the file you need a force save with `wq!`



###### Add user to wheel group

```
gpasswd -a xeraph wheel
```

Close session and login with your user



###### Install zsh

```shell
sudo pacman -S zsh
```

###### Configure zsh as default shell

```shell
chsh -s /bin/zsh
```

###### Install oh-my-zsh

```shell
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

###### Install plugins for zsh

```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

```



Change to `zsh`



###### Create aur.sh to get aur packages easily

En ~/.local/bin/aur.sh

```bash
#!/bin/bash

if [ -z $AUR_PATH ]; then
	echo "Please set AUR_PATH in your envs"
	exit 1
fi

if [ -z $1 ]; then
	echo "Missing package name"
	exit 1
fi


package_path="$AUR_PATH/$1"

if [ -d $package_path ]; then
	printf "Directory $package_path already exists. You want delete it? Press Enter (Y|n) "
	
	while read line; do
		rm -rf $package_path
		break
	done
fi

git clone https://aur.archlinux.org/$1.git $package_path
cd $package_path
makepkg -si
```



###### Add custom zsh configuration a zsh (in ~/.zshrc)

```
#-------------------#
#	   Aliases		#
#-------------------#

# pacman
alias pm="pacman"
# pacman with sudo
alias spm="sudo pacman"
# Search package
alias pmSs="pm -Ss"
# Install package
alias spmS="spm -S"
# Update database of packages
alias spmSy="spm -Sy"
# Force update database of packages
alias spmSyy="spm -Syy"

# ls
alias ls="ls --color=auto"

# clear
alias cl="clear"

# aur
alias aur="sh aur.sh"

# btop
alias btop="sudo btop"

# nethogs
alias nethogs="sudo nethogs"

#-------------------#
#	Environments	#
#-------------------#
export PATH=$PATH:$HOME/.local/bin
export AUR_PATH=$HOME/aur
```

`source ~/.zshrc`



###### Install programs

```shell
spmS xorg-server xorg-xinit i3-gaps lightdm lightdm-gtk-greeter neofetch alacritty nvidia nvidia-utils alsa-utils pulseaudio pulseaudio-alsa pavucontrol chromium nautilus btop nethogs rofi picom gnome-disk-utility gnome-tweaks gnome-system-monitor unzip fontconfig

aur polybar-git
aur nerd-fonts-jetbrains-mono
```

In virtual maching install  `xf86-video-intel mesa` instance of `nvidia` y `nvidia-utils`



###### Install rust

```shell
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```



Comment lines of `/etc/X11/xinit/xinitrc`

from: #twm & 
to: #exec xterm ....

```shell
systemctl enable lightdm
systemctl start lightdm
```

