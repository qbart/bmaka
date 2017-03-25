## Things that require manual installation
----
### [Neovim](https://github.com/neovim/neovim)

`sudo apt install software-properties-common python-dev python-pip python3-dev python3-pip silversearcher-ag`  
`sudo add-apt-repository -y ppa:neovim-ppa/unstable`  
`sudo apt update`  
`sudo apt install neovim`


### [Vim-Plug](https://github.com/junegunn/vim-plug)

`curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

`curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`


### [Oh-My-Zsh](https://github.com/robbyrussell/oh-my-zsh) plugins

[zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)


`git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions`


[alias-tips](https://github.com/djui/alias-tips)


`git clone https://github.com/djui/alias-tips.git $ZSH_CUSTOM/plugins/alias-tips`


[zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)


`git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`

### check if console supports 24bit - truecolor
`bash testcase-truecolors.sh`

![](http://i.imgur.com/2OfD8qT.png, "Truecolor")

![](http://i.imgur.com/B7npkfM.png, "Not really")


### ppa repositories you might want to add


`sudo add-apt-repository -y ppa:maarten-baert/simplescreenrecorder`  
`sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer`

----

## Common bugs

### Low cpu frequency after suspending laptop
###### (dell latitude e6430 / i5-3220m)

#### diagnosis
`watch -n 1 -d "cat /proc/cpuinfo | grep -i Mhz"`  
shows too low frequency (less than 1200 for my cpu)  
`sudo modprobe msr`  
`sudo rdmsr -a 0x19a`  
returns something other than `0`

#### temporary solution
you have to set register `0x19a` to `0` with `wrmsr -a 0x19a 0x0`

#### permanent solution

`sudo cp 10_fix_low_cpu_frequency /lib/systemd/system-sleep/`  
`sudo chmod +x /lib/systemd/system-sleep/10_fix_low_cpu_frequency`  
`sudo echo 'msr' >> /etc/modules`
