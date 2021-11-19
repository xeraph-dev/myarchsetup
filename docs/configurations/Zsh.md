# Zsh



###### Install zsh

```shell
sudo pacman -S zsh
```



###### Install oh-my-zsh

```shell
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```



#### Install plugins for oh-my-zsh



###### zsh-autosuggestions

```shell
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

###### zsh-syntax-highlighting

```shell
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```



###### Download configuration

````
wget -O - https://raw.githubusercontent.com/adrianrl99/myarchsetup/main/zshrc > ~/.zshrc
````



###### Change to zsh

```shell
zsh
```



###### Configure zsh as default shell

```shell
chsh -s /bin/zsh
```
