## Penguin's eggs ppa

To build this ppa I follow this [assafmo guide](https://assafmo.github.io/2019/05/02/ppa-repo-hosted-on-github.html). I was not able to include all architectures in this repository, and it is a pity, becouse can be great for i386 users. If you can help to include the i386, arm64 and armel versions in this repository, you are really welcome.


### Build the repository
* Create an normal repository in github, like penguins-eggs-ppa
* Go to Settings, then Pages and choose main as default branch for pages

### Security and list
```
gpg --import ../piero.proietti-my-private-key.asc 
gpg --armor --export piero.proietti@gmail.com > KEY.gpg
echo "deb https://pieroproietti.github.io/penguins-eggs-ppa ./" > penguins-eggs-ppa.list
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
Copy and paste in a terminal window the following two lines

```
wget -O- https://pieroproietti.github.io/penguins-eggs-ppa/KEY.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/penguins-eggs-ppa-keyring.gpg
curl -s --compressed "https://pieroproietti.github.io/penguins-eggs-ppa/KEY.gpg" | sudo apt-key add -
sudo curl -s --compressed -o /etc/apt/sources.list.d/penguins-eggs-ppa.list "https://pieroproietti.github.io/penguins-eggs-ppa/penguins-eggs-ppa.list"
```

Now you can install and upgrade eggs from standard apt commands, remember ```sudo apt update```

# Help wanted
Probably it is not so difficult to arrange a repository for eggs with all the supported architectures: amd64, i386, arm64 and armel, but I'm not able at the momenti, someone can help? 