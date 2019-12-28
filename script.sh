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
chown root:root /etc/passwd 
chmod 644 /etc/passwd
chown root:shadow /etc/shadow 
chmod o-rwx,g-wx /etc/shadow 
chown root:root /etc/group 
chmod 644 /etc/group
chown root:shadow /etc/gshadow 
chmod o-rwx,g-rw /etc/gshadow
chown root:root /etc/passwd-
chmod u-x,go-wx /etc/passwd-
chown root:root /etc/shadow-
chown root:root /etc/group-
chmod u-x,go-wx /etc/group- 
chown root:shadow /etc/shadow- 
chmod o-rwx,g-rw /etc/shadow- 
chown root:root /etc/gshadow- 
chown root:shadow /etc/gshadow- 
chmod o-rwx,g-rw /etc/gshadow-
cat /etc/passwd | awk -F: '($3 == 0) { print $1 }' root
grep ^shadow:[^:]*:[^:]*:[^:]+ /etc/group # awk -F: '($4 == "<shadow-gid>"){ print }' /etc/passwd
df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type d -perm -0002 2>/dev/null | xargs chmod a+t
chown root:root /boot/grub/grub.cfg 
chmod og-rwx /boot/grub/grub.cfg
chown root:root /etc/issue 
chmod 644 /etc/issue 
chown root:root /etc/issue.net 
chmod 644 /etc/issue.net
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
done

