# Install updates
sudo yum -y update


#install apache 2.4 php5
sudo yum install httpd php php-mysql -y


#start httpd
sudo service httpd start

#auto-start 
sudo chkconfig httpd on
sudo chkconfig firewalld off
sudo chkconfig iptables off
sudo service firewalld stop
sudo service iptables stop

#set selinux
sudo sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/sysconfig/selinux
sudo sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/selinux/config
sudo setenforce 0

