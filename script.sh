cat /etc/passwd | grep "/home" | cut -d":" -f1 > user-list.txt
cat user-list.txt | while read user
do
echo "Changing $user's password"
yes "Cyb3rPatriot1!" | passwd $user
sudo chage -M 30 $user
sudo chage -m 1 $user
sudo chage -W 5 $user
\cp $HOME/Desktop/UbuntuScript/common-password /etc/pam.d/
\cp $HOME/Desktop/UbuntuScript/login.defs /etc/
sudo apt-get install gufw
sudo ufw enable
sysctl -n net.ipv4.tcp_syncookies
echo "net.ipv6.conf.all.disable_ipv6 = 1" | sudo tee -a /etc/sysctl.conf
echo 0 | sudo tee /proc/sys/net/ipv4/ip_forward
echo "nospoof on" | sudo tee -a /etc/host.conf
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

systemctl disable snmpd
systemctl disable squid
systemctl disable smbd 
systemctl disable dovecot
systemctl disable bind9 
systemctl disable slapd
systemctl disable isc-dhcp-server 
systemctl disable isc-dhcp-server6
systemctl disable cups 
systemctl disable avahi-daemon 
systemctl disable autofs
cp $HOME/Desktop/UbuntuScript/systemwide_user.js /etc/firefox/syspref.js

echo "kernel.dmesg_restrict = 1" > /etc/sysctl.d/50-dmesg-restrict.conf
echo "kernel.kptr_restrict = 1" > /etc/sysctl.d/50-kptr-restrict.conf
echo "kernel.exec-shield = 2" > /etc/sysctl.d/50-exec-shield.conf
echo "kernel.randomize_va_space=2" > /etc/sysctl.d/50-rand-va-space.conf
systemctl enable rsyslog
systemctl start rsyslog
done

