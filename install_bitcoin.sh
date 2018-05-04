#!/bin/sh
  
cd ~
git clone https://github.com/zhq422194011/bitcoin.git
cd ~
mkdir bitcoin/db4/
wget 'http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz'
tar -xzvf db-4.8.30.NC.tar.gz
rm db-4.8.30.NC.tar.gz
cd db-4.8.30.NC/build_unix/
../dist/configure --enable-cxx --disable-shared --with-pic --prefix=/home/theusername/bitcoin/db4/
make install

cd ~/bitcoin/
./autogen.sh
./configure LDFLAGS="-L/home/theusername/bitcoin/db4/lib/" CPPFLAGS="-I/home/theusername/bitcoin/db4/include/"

make -s -j5

