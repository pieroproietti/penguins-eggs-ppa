#!/bin/bash

LAST_RELEASE="26.1.24-1"
URL_BASE="https://penguins-eggs.net/basket/packages/debs/"

amd64=("penguins-eggs_${LAST_RELEASE}_amd64.deb")
arm64=("penguins-eggs_${LAST_RELEASE}_arm64.deb")
i386=("penguins-eggs_${LAST_RELEASE}_i386.deb")
riscv64=("penguins-eggs_${LAST_RELEASE}_riscv64.deb")

wget -q -O "dists/amd64/$amd64" "$URL_BASE/$amd64"
wget -q -O "dists/arm64/$arm64" "$URL_BASE/$arm64"
wget -q -O "dists/i386/$i386" "$URL_BASE/$i386"
wget -q -O "dists/riscv64/$riscv64" "$URL_BASE/$riscv64"

