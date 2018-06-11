echo Installing git-core
apt-get install git-core

echo Moving to /opt
cd /opt

echo Cloning PlexPy
git clone https://github.com/Tautulli/Tautulli.git /opt/tautulli

echo Moving to /opt/plexpy
cd /opt/tautulli

echo Creating /etc/default/plexpy
touch /etc/default/tautulli

echo Creating plexpy user
adduser --system --no-create-home tautulli
echo Change owner to plexpy of the /opt/plexpy folder
chown tautulli:nogroup -R /opt/tautulli

echo Making the init file executable
chmod +x /opt/tautulli/init-scripts/init.ubuntu

echo Making PlexPy booting at startup
ln -s /opt/tautulli/init-scripts/init.ubuntu /etc/init.d/tautilli
update-rc.d tautulli defaults

echo Starting PlexPy
service plexpy tautulli
