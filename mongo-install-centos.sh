# Install Apache
install_apache(){
    # Install Apache
    echo "Start Installing Apache..."
    yum -y install httpd
    cp -f $cur_dir/conf/httpd.conf /etc/httpd/conf/httpd.conf
    rm -fv /etc/httpd/conf.d/welcome.conf /data/www/error/noindex.html
    chkconfig httpd on
    mkdir -p /data/www/default
    chown -R apache:apache /data/www/default
    touch /etc/httpd/conf.d/none.conf
    cp -f $cur_dir/conf/index.html /data/www/default/
    cp -f $cur_dir/conf/index_cn.html /data/www/default/
    cp -f $cur_dir/conf/lamp.gif /data/www/default/
    cp -f $cur_dir/conf/p.php /data/www/default/
    cp -f $cur_dir/conf/p_cn.php /data/www/default/
    cp -f $cur_dir/conf/jquery.js /data/www/default/
    cp -f $cur_dir/conf/phpinfo.php /data/www/default/
    echo "Apache Install completed!"
}

sudo iptables -I INPUT -p tcp --dport 80 -j ACCEPT

sudo service iptables save

yum install php-5.2.17

sudo /usr/sbin/apachectl restart
