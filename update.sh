#!/bin/bash

LAST_RELEASE="25.11.14"
URL_BASE="https://penguins-eggs.net/basket/packages/debs/"

amd64=("penguins-eggs_${LAST_RELEASE}-1_amd64.deb")
arm64=("penguins-eggs_${LAST_RELEASE}-1_arm64.deb")
i386=("penguins-eggs_${LAST_RELEASE}-1_i386.deb")

wget -q -O "dists/amd64/$amd64" "$URL_BASE/$amd64"
wget -q -O "dists/arm64/$arm64" "$URL_BASE/$arm64"
wget -q -O "dists/i386/$i386" "$URL_BASE/$i386"
