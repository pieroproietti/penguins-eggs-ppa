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
Add the deb files in the `dists` dir followed by deb architecture

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
curl -fsSL https://pieroproietti.github.io/penguins-eggs-ppa/KEY.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/penguins-eggs.gpg
echo "deb [arch=$(dpkg --print-architecture)] https://pieroproietti.github.io/penguins-eggs-ppa ./" | sudo tee /etc/apt/sources.list.d/penguins-eggs.list > /dev/null
```

Now you can install and upgrade eggs from standard apt commands, remember ```sudo apt update```

# Help wanted
Probably it is not so difficult to arrange a repository for eggs with all the supported architectures: amd64, i386, arm64 and armel, but I'm not able at the momenti, someone can help? 