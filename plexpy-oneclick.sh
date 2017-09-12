echo Installing git-core
apt-get install git-core

echo Moving to /opt
cd /opt

echo Cloning PlexPy
git clone https://github.com/drzoidberg33/plexpy.git

echo Moving to /opt/plexpy
cd /opt/plexpy

echo Creating /etc/default/plexpy
touch /etc/default/plexpy

echo Creating plexpy user
adduser --system --no-create-home plexpy
echo Change owner to plexpy of the /opt/plexpy folder
chown plexpy:nogroup -R /opt/plexpy

echo Making the init file executable
chmod +x /opt/plexpy/init-scripts/init.ubuntu

echo Making PlexPy booting at startup
ln -s /opt/plexpy/init-scripts/init.ubuntu /etc/init.d/plexpy
update-rc.d plexpy defaults

echo Starting PlexPy
service plexpy start
