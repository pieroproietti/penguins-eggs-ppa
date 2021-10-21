## Penguin's eggs ppa

To build this ppa I follow this [assafmo guide](https://assafmo.github.io/2019/05/02/ppa-repo-hosted-on-github.html)


### Build the repositoy
* Create an normal repository in github, like penguins-eggs-ppa
* Go to Settings, then Pages and choose main as default branch for pages

### Security and list
```
gpg --import ../piero.proietti-my-private-key.asc 
gpg --armor --export piero.proietti@gmail.com > KEY.gpg
echo "deb https://pieroproietti.github.io/penguins_eggs_ppa ./" > penguins_eggs_ppa.list
```

### Update debs
Add the deb files in the root

```
dpkg-scanpackages --multiversion . > Packages
gzip -k -f Packages
apt-ftparchive release . > Release
gpg --default-key piero.proietti@gmail.com -abs -o - Release > Release.gpg
gpg --default-key piero.proietti@gmail.com  --clearsign -o - Release > InRelease
git add -A
git commit
git push
```

# Usage of the repository
```
curl -s --compressed "https://pieroproietti.github.io/penguins-eggs-ppa/KEY.gpg" | sudo apt-key add -
sudo curl -s --compressed -o /etc/apt/sources.list.d/penguins-eggs-ppa.list "https://pieroproietti.github.io/penguins-eggs-ppa/penguins-eggs-ppa.list"
sudo apt update
```
