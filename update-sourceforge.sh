#!/bin/bash

LAST_RELEASE="25.11.12"
URL_BASE="https://penguins-eggs.net/basket/packages/"

amd64=("penguins-eggs_${LAST_RELEASE}-1_amd64.deb")
arm64=("penguins-eggs_${LAST_RELEASE}-1_arm64.deb")
i386=("penguins-eggs_${LAST_RELEASE}-1_i386.deb")

rm -rf /tmp/eggs
mkdir -p /tmp/eggs/alpine/x86_64 
mkdir -p /tmp/eggs/aur
mkdir -p /tmp/eggs/debs
mkdir -p /tmp/eggs/el9
mkdir -p /tmp/eggs/fedora
mkdir -p /tmp/eggs/manjaro
mkdir -p /tmp/eggs/opensuse

# Alpine
PACKNAME="penguins-eggs-$LAST_RELEASE-r1.apk"
wget -q -O "/tmp/eggs/alpine/x86_64/$PACKNAME" "$URL_BASE/alpine/x86_64/$PACKNAME"

PACKNAME="penguins-eggs-bash-completion-$LAST_RELEASE-r1.apk"
wget -q -O "/tmp/eggs/alpine/x86_64/$PACKNAME" "$URL_BASE/alpine/x86_64/$PACKNAME"

PACKNAME="penguins-eggs-doc-$LAST_RELEASE-r1.apk"
wget -q -O "/tmp/eggs/alpine/x86_64/$PACKNAME" "$URL_BASE/alpine/x86_64/$PACKNAME"

# Arch
PACKNAME="penguins-eggs-$LAST_RELEASE-1-any.pkg.tar.zst"
wget -q -O "/tmp/eggs/aur/$PACKNAME" "$URL_BASE/aur/$PACKNAME"

# Debian
wget -q -O "/tmp/eggs/debs/$amd64" "$URL_BASE/debs/$amd64"
wget -q -O "/tmp/eggs/debs/$arm64" "$URL_BASE/debs/$arm64"
wget -q -O "/tmp/eggs/debs/$i386" "$URL_BASE/debs/$i386"

# EL9
PACKNAME="penguins-eggs-$LAST_RELEASE-1.el9.x86_64.rpm"
wget -q -O "/tmp/eggs/el9/$PACKNAME" "$URL_BASE/el9/$PACKNAME"

# Fedora
PACKNAME="penguins-eggs-$LAST_RELEASE-1.fc42.x86_64.rpm"
wget -q -O "/tmp/eggs/fedora/$PACKNAME" "$URL_BASE/fedora/$PACKNAME"

# Manjaro
PACKNAME="penguins-eggs-$LAST_RELEASE-1-any.pkg.tar.zst"
wget -q -O "/tmp/eggs/manjaro/$PACKNAME" "$URL_BASE/manjaro/$PACKNAME"

# Opensuse
PACKNAME="penguins-eggs-$LAST_RELEASE-1.x86_64.rpm"
wget -q -O "/tmp/eggs/opensuse/$PACKNAME" "$URL_BASE/opensuse/$PACKNAME"
