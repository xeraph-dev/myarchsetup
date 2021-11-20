# Vim



###### Download configuration

```shell
wget -O - https://raw.githubusercontent.com/adrianrl99/myarchsetup/main/vimrc > ~/.vimrc
```



###### Install vim-plug

```shell
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```



###### Install code-minimap

```shell
auri code-minimap
```

This need [Rust](../Pre-configuration.md)



###### Install vim plugins

```shell
vim ~/.vimrc
```

Type `:PlugInstall`

