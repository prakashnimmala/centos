# Install updates
yum -y update

install_ap() {


	#install apache 2.4 php5
	yum install httpd php php-mysql -y


	#start httpd
	service httpd start

	#auto-start 
	chkconfig httpd on
	chkconfig firewalld off
	chkconfig iptables off
	service firewalld stop
	service iptables stop

	#set selinux
	sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/sysconfig/selinux
	sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/selinux/config
	setenforce 0

}
