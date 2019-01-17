echo "0 4 * * 0 apt-get -y update>> /var/log/update_script.log && apt-get -y uprgrade" >> /etc/crontab
crontab-l
