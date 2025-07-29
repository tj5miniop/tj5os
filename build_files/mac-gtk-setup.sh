mkdir tmp && cd tmp


git clone https://github.com/vinceliuice/MacTahoe-gtk-theme.git --depth=1 && ./MacTahoe-gtk-theme/install.sh -o normal -b -l -c dark --theme purple --shell -i fedora 
cd ../ && https://github.com/vinceliuice/MacTahoe-icon-theme && ./MacTahoe-icon-theme/install.sh

cd ../ && sudo rm -rf /tmp