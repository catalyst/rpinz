#! /bin/bash

PIRELEASE=`lsb_release -cs`

if [ $PIRELEASE = 'jessie' ]
then
  CONSOLESETUP='console-setup'
else
  PIRELEASE='stretch'
  CONSOLESETUP='console-setup.sh'
fi

echo ''
echo "### Raspbian NZ customisations for $PIRELEASE###"
echo ''
echo ''

if [ "$EUID" -ne 0 ]
then
  echo "Please run as root"
  exit 1
fi

cd /tmp

echo '### Configuring NZ Software mirrors ..'
echo ''
echo '## Comment out existing mirrors ..'
echo ''
sed -i -e 's/^deb/# deb/' /etc/apt/sources.list

echo '## Set NZ mirror (http://mirror.fsmg.org.nz/raspbian/) .. '
echo ''
wget http://mirror.fsmg.org.nz/raspbian/raspbian.public.key
apt-key add ./raspbian.public.key
echo "deb http://mirror.fsmg.org.nz/raspbian/raspbian/ $PIRELEASE main contrib non-free rpi" >> /etc/apt/sources.list

echo ''
echo '## Updating package list ..'
echo ''
apt-get update

echo ''
echo '### Configure NZ locale information ..'
echo ''
echo '## Update /etc/locale.gen ..'
sed -i -e 's/^en_GB.UTF-8 UTF-8/# en_GB.UTF-8 UTF-8/' /etc/locale.gen
sed -i -e 's/# en_NZ.UTF-8 UTF-8/en_NZ.UTF-8 UTF-8/' /etc/locale.gen
sed -i -e 's/# mi_NZ.UTF-8 UTF-8/mi_NZ.UTF-8 UTF-8/' /etc/locale.gen

echo ''
echo '## Remove old locales and generate ..'
locale-gen --purge

echo ''
echo '## Setting English New Zealand as our default language ..'
echo -e 'LANG="en_NZ.UTF-8"\nLANGUAGE="en_NZ:en"\n' > /etc/default/locale

echo ''
echo '## Setting the māori keyboard ..'
sed -i s/^XKBLAYOUT.*/XKBLAYOUT=\"mao\"/ /etc/default/keyboard

# Macron support in the console.
cat <<EOF > /etc/default/console-setup
# CONFIGURATION FILE FOR SETUPCON

# Consult the console-setup(5) manual page.

ACTIVE_CONSOLES="/dev/tty[1-6]"

CHARMAP="UTF-8"

CODESET="guess"
FONTFACE="Fixed"
FONTSIZE=""

VIDEOMODE=

# The following is an example how to use a braille font
# FONT='lat9w-08.psf.gz brl-8x8.psf'
EOF

echo ''
echo '## Restarting console-setup ..'
/etc/init.d/$CONSOLESETUP restart

echo ''
echo '### Setting Timezone ..'
echo ''
timedatectl set-timezone Pacific/Auckland

echo ''
echo '## Setting NZ based time servers ..'
sed -i -e 's/#server ntp.your-provider.example/#server ntp.your-provider.example\nserver s1.ntp.net.nz\nserver s2.ntp.net.nz\nserver s3.ntp.net.nz\nserver s4.ntp.net.nz/' /etc/ntp.conf

echo ''
echo '## Restarting time service ..'
/etc/init.d/ntp restart

# en_nz & mi_nz dictionaries (currently hosted on the catalyst repo)

echo ''
echo '### All Done ###'
echo 
