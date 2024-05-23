# installing i3

sudo apt install i3-wm rofi


sudo apt install stow
cd
sudo apt install git
git clone https://gitlab.com/kiedan/dotfiles.git

sudo apt install stow
cd .config/i3/
rm config

cd
cd dotfiles/
rm README.md 
stow *

# install i3-gaps
sudo add-apt-repository ppa:kgilmer/speed-ricer
sudo apt-get update
sudo apt install i3-gaps-wm

# installing fonts
wget -P ~/Downloads/ https://github.com/FortAwesome/Font-Awesome/releases/download/5.15.3/fontawesome-free-5.15.3-web.zip
cd ~/Downloads
unzip fontawesome-free-5.15.3-web.zip
cd fontawesome-free-5.15.3-web/webfonts
mkdir ~/.fonts
cp *.ttf ~/.fonts

wget -P ~/.fonts/ https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.ttf

wget -P ~/.fonts/ https://github.com/google/fonts/raw/main/apache/roboto/static/Roboto-Regular.ttf 
wget -P ~/.fonts/ https://github.com/google/fonts/raw/main/apache/roboto/static/Roboto-Bold.ttf
wget -P ~/.fonts/ https://github.com/google/fonts/raw/main/apache/roboto/static/RobotoCondensed-Regular.ttf

wget -P ~/.fonts/ https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf

#i3 bocks
sudo apt install i3blocks

# Terminal 
sudo apt install rxvt-unicode
xrdb ~/.Xresources


# Wallpaper
sudo apt install feh

# Rounded Corners (i3-radius)

sudo apt install build-essential autoconf autotools-dev cmake libev-dev libstartup-notification0-dev xcb libxcb-randr0-dev libxcb-shape0-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-util-dev libxcb-cursor-dev libxcb-keysyms1-dev libxcb-icccm4-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev libyajl-dev libpcre++-dev libpango1.0-dev

git clone https://github.com/terroo/i3-radius
cd i3-radius && sh build.sh


(sudo apt install compton)

#XMENU
cd ~/Downloads
git clone https://github.com/phillbush/xmenu.git
sudo apt-get install libx11-dev libxinerama-dev libimlib2 libimlib2-dev
cd ~/Downloads/xmenu
make
sudo make install

# Install syncthing (see: https://syncthing.net/downloads/ )
# Add the "stable" channel to your APT sources:
echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
# Add the release PGP keys:
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
# Update and install syncthing:
sudo apt-get update
sudo apt-get install syncthing



#Spotify
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client

#spicetify
curl -fsSL https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.sh -o /tmp/install.sh
sh /tmp/install.sh 1.2.1
#(add spicetify to path in .bashrc or)
spicetify

sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R

sudo spicetify backup apply enable-devtool

git clone https://github.com/giovanebribeiro/spotify-gruvbox-theme /home/dan/.config/spicetify/Themes/Gruvbox
# (change theme in /home/dan/.config/spicetify/config.ini )

spicetify update 

TODO
----
- GTK Themes 
- Fonts
- Firefox theme
- sync vimwiki folder
- add xmenu application menu to i3 bar @done


Nice helpfull Stuff
-------------------
great gruvbox rice git: https://github.com/zodd18/Gruvbox (inkluding openbox theme)

NOTES
------
add wallpaper to stow+dotfiles repo @done
add ~/.urxvt/ext/ to dotfile to include urxvt extensions
sort extensions in .Xressources and add missing ones to ext folder
add jgmenu to stow 


