## Penguin's eggs ppa

To build this ppa I follow this
[assafmo guide](https://assafmo.github.io/2019/05/02/ppa-repo-hosted-on-github.html).
I was not able to include all architectures in this repository, and it is a
pity, becouse can be great for i386 users. If you can help to include the i386,
arm64 and armel versions in this repository, you are really welcome.

### Build the repository

- Create an normal repository in github, like penguins-eggs-ppa
- Go to Settings, then Pages and choose main as default branch for pages

### Security and list

```
gpg --import ../piero.proietti-my-private-key.asc 
gpg --armor --export piero.proietti@gmail.com > KEY.gpg
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

## Debian 12 bookwom, Ubuntu 22.04 LTS (Jammy) and previous
Copy and paste in a terminal window the following two lines:

```
curl -fsSL https://pieroproietti.github.io/penguins-eggs-ppa/KEY.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/penguins-eggs.gpg
echo "deb [arch=$(dpkg --print-architecture)] https://pieroproietti.github.io/penguins-eggs-ppa ./" | sudo tee /etc/apt/sources.list.d/penguins-eggs.list > /dev/null
```
## Debian 13 trixe, Ubuntu 23.04 LTS (Noble) and following
```
curl -fsSL https://pieroproietti.github.io/penguins-eggs-ppa/KEY.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/penguins-eggs.gpg
echo "
Types: deb
URIs: https://pieroproietti.github.io/penguins-eggs-ppa
Suites: ./
Signed-By: /usr/share/keyrings/penguins-eggs-ppa.gpg
" | sudo tee /etc/apt/sources.list.d/penguins-eggs-ppa.sources > /dev/null
```

Now you can install and upgrade eggs from standard apt commands, remember
`sudo apt update`

# More informations

There is a [Penguins' eggs official book](https://penguins-eggs.net/book/) and
same other documentation - mostly for developers - on
[penguins-eggs repo](https://github.com/pieroproietti/penguins-eggs) under
**documents**.

You can contact me by [mail](mailto://pieroproietti@gmail.com) or follow me on
[blog](https://penguins-eggs.net),
[facebook](https://www.facebook.com/groups/128861437762355/),
[github](https://github.com/pieroproietti/penguins-krill),
[jtsi](https://meet.jit.si/PenguinsEggsMeeting),
[reddit](https://www.reddit.com/user/Artisan61),
[telegram](https://t.me/penguins_eggs),
[twitter](https://twitter.com/pieroproietti).

# Copyright and licenses

Copyright (c) 2017, 2023
[Piero Proietti](https://penguins-eggs.net/about-me.html), dual licensed under
the MIT or GPL Version 2 licenses.

# Acknowledgements

Many thanks to [sunuazizrahayu](https://github.com/sunuazizrahayu) for the kind
cooperation in making this multi-architecture repository
