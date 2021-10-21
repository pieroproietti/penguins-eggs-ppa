## Penguin's eggs ppa

### Build the repositoy
* Create an normal repository in github, like penguins-eggs-ppa
* Go to Settings, then Pages and choose main as default branch for pages

### 
```
gpg --import ../piero.proietti-my-private-key.asc 
gpg --armor --export piero.proietti@gmail.com > KEY.gpg
echo "deb https://pieroproietti.github.io/penguins_eggs_ppa ./" > penguins_eggs_ppa.list
```

Add the deb files in the root

```
dpkg-scanpackages --multiversion . > Packages
gzip -k -f Packages
apt-ftparchive release . > Release
gpg --default-key piero.proietti@gmail.com -abs -o - Release > Release.gpg
gpg --default-key piero.proietti@gmail.com  --clearsign -o - Release > InRelease
echo "deb https://github.com/.github.io/penguins_eggs_ppa ./" > penguins_eggs_ppa.list
```

### Push
```
git add -A
git commit
git push
```

# Usage of the repository
```
curl -s --compressed "https://pieroproietti.github.io/penguins_eggs_ppa/KEY.gpg" | sudo apt-key add -
sudo curl -s --compressed -o /etc/apt/sources.list.d/penguins_eggs_ppa.list "https://pieroproietti.github.io/penguins_eggs_ppa/penguins_eggs_ppa.list"
sudo apt update
```
