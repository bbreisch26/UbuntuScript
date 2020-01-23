sudo \cp $HOME/Desktop/UbuntuScript/common-password /etc/pam.d/
sudo \cp $HOME/Desktop/UbuntuScript/login.defs /etc/
sudo apt-get install gufw
sudo ufw enable
sudo sysctl -n net.ipv4.tcp_syncookies
sudo echo 'net.ipv6.conf.all.disable_ipv6 = 1' | sudo tee -a /etc/sysctl.conf
sudo echo 0 | sudo tee /proc/sys/net/ipv4/ip_forward
sudo echo "nospoof on" | sudo tee -a /etc/host.conf
sudo apt-get remove zenmap
sudo apt-get remove nmap
sudo apt-get remove wireshark
sudo apt-get remove netcat
sudo apt-get remove hydra
sudo apt-get remove ophcrack
sudo apt-get remove medusa
sudo apt-get remove cryptcat
sudo apt-get remove samba
sudo apt-get remove kismet
sudo updatedb	
locate *.mp3 *.txt *.mp4 *.wav *.avi | grep ^/home

sudo systemctl disable snmpd
sudo systemctl disable squid
sudo systemctl disable smbd 
sudo systemctl disable dovecot
sudo systemctl disable bind9 
sudo systemctl disable slapd
sudo systemctl disable isc-dhcp-server 
sudo systemctl disable isc-dhcp-server6
sudo systemctl disable cups 
sudo systemctl disable avahi-daemon 
sudo systemctl disable autofs
cp $HOME/Desktop/UbuntuScript/systemwide_user.js /etc/firefox/syspref.js

sudo /bin/su -c "echo 'kernel.dmesg_restrict = 1' > /etc/sysctl.d/50-dmesg-restrict.conf"
sudo /bin/su -c "echo 'kernel.kptr_restrict = 1' > /etc/sysctl.d/50-kptr-restrict.conf"
sudo /bin/su -c "echo 'kernel.exec-shield = 2' > /etc/sysctl.d/50-exec-shield.conf"
sudo /bin/su -c "echo 'kernel.randomize_va_space=2' > /etc/sysctl.d/50-rand-va-space.conf"
sudo systemctl enable rsyslog
sudo systemctl start rsyslog

