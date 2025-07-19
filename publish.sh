#!/bin/bash
dpkg-scanpackages --multiversion . > Packages
gzip -k -f Packages
apt-ftparchive release . > Release
gpg --default-key piero.proietti@gmail.com -abs -o - Release > Release.gpg
gpg --default-key piero.proietti@gmail.com  --clearsign -o - Release > InRelease
