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


### Remove / promote administrators based on admins.txt file ###
# Function to check if a user is an administrator
is_admin() {
    local user="$1"
    if sudo getent group sudo | grep -q "$user"; then
        return 1  # User is in the sudo group
    elif sudo getent group admin | grep -q "$user"; then
        return 1  # User is in the admin group
    elif sudo grep -q "$user" /etc/sudoers; then
        return 1  # User is explicitly listed in sudoers
    else
        return 0  # User is not an admin
    fi
}

# Function to promote a user to admin
promote_to_admin() {
    local user="$1"
    sudo usermod -aG sudo "$user"
    echo "Promoted $user to admin"
}

# Function to demote a user from admin
demote_from_admin() {
    local user="$1"
    sudo deluser "$user" sudo
    sudo deluser "$user" admin
    echo "Removed $user from admin"
}

# Main script starts here
while IFS= read -r users; do
    if is_admin "$user"; then
        echo "$user is already an admin"
    else
        promote_to_admin "$user"
    fi
done < admins.txt

# Check for users that are admin but shouldn't be
current_admins=$(sudo getent group sudo ; sudo getent group admin | awk -F: '{print $4}')
for admin in $current_admins; do
    if ! grep -q "^$admin$" admins.txt; then # admin file is called admins.txt
        demote_from_admin "$admin"
    fi
done

#### Add/remove users based on users.txt ####

# Function to add a user with a clear-text password
add_user_with_password() {
    local username="$1"
    local password="BlasterR0x123!"
    sudo useradd -m -p "$(echo "$password" | openssl passwd -1 -stdin)" "$username"
    echo "Added user $username with password $password"
}

# Function to delete a user
delete_user() {
    local username="$1"
    sudo deluser --remove-home "$username"
    echo "Deleted user $username"
}

change_password() {
    local username="$1"
    local password="$2"
    echo $password | sudo passwd $username
    echo "Changed $user 's password"
}

# Main script starts here
while IFS= read -r line; do
    username=$(echo "$line" | awk '{print $1}')
    password="BlasterR0x123!"
    if id "$username" &>/dev/null; then
        change password "$username" "$password" 
    else
        add_user_with_password "$username"
    fi
done < users.txt

current_users=$(awk -F:':' '{ print $1}' /etc/passwd)
for user in $current_admins; do
    if ! grep -q "^$user$" users.txt; then # admin file is called admins.txt
        delete_user "$user"
    fi
done

#### Set permissions of important files ####

sudo chown root:root /etc/passwd
sudo chown root:shadow /etc/shadow
sudo chmod 644 /etc/passwd
sudo chmod 640 /etc/shadow

