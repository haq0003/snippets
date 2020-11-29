1) Téléchargez les packages dont dépendent pdftk et pdftk


wget http://archive.ubuntu.com/ubuntu/pool/main/g/gcc-defaults/libgcj-common_6.4-3ubuntu1_all.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/g/gcc-6/libgcj17_6.4.0-8ubuntu1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/universe/p/pdftk/pdftk_2.02-4build1_amd64.deb
2) Installez les dépendances dans cet ordre


sudo dpkg -i libgcj-common_6.4-3ubuntu1_all.deb


sudo apt install gcc-6-base


sudo dpkg -i libgcj17_6.4.0-8ubuntu1_amd64.deb
3) Installez pdftk


sudo dpkg -i pdftk_2.02-4build1_amd64.deb
Résultat:


pdftk --version
pdftk 2.02 a Handy Tool for Manipulating PDF Documents
