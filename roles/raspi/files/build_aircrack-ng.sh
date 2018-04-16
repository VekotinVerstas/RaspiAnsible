# This must be executed as root or sudo

cd /usr/local/src/aircrack-ng-1.2
autoreconf -i
./configure --with-experimental
make -j4
make install
