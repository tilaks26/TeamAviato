echo 'killing existing tomcat process if any'
cd /usr/local/tomcat7/apache-tomcat-7.0.72
sudo sh ./bin/shutdown.sh
sleep 20
export JAVA_HOME=/usr/lib/jvm/jre-1.7.0-openjdk.x86_64
echo 'check if maven is installed'
mvn --version
if [ "$?" -ne 0 ]; then
    echo 'Installing Maven...'
	sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
	sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
	sudo yum install -y apache-maven
	mvn --version
fi
rm -rf /home/ec2-user/registry
