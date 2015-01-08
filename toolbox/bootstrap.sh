#!/bin/sh

PASSWORD=pass1234

echo "[**] Installing dependencies."
sudo apt-get -y install expect 2>&1 >/dev/null

echo "[**] Bootstrapping IPython profile."
/usr/bin/expect -c "eval spawn dst setup base; expect \"password:\"; send \"$PASSWORD\r\"; expect \"password:\"; send \"$PASSWORD\r\"; expect eof" 2>&1 >/dev/null

echo "[**] Installing tools available on command line."

dst add dsatcl 2>&1 >/dev/null
echo "[ii] Tools installed."

sudo ipython notebook --profile=dst & 2>&1 >/dev/null
echo "[ii] IPython notebook started."
