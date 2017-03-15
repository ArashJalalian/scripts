# https://github.com/rabbitmq/erlang-rpm/releases
# https://www.rabbitmq.com/install-rpm.html
# Install and setup rabbitmq on Amazon Linux.
sudo yum install wget
wget https://github.com/rabbitmq/erlang-rpm/releases/download/v19.3.0/erlang-19.3.0-1.el6.x86_64.rpm
sudo yum install ./erlang-19.3.0-1.el6.x86_64.rpm 
wget https://github.com/rabbitmq/rabbitmq-server/releases/download/rabbitmq_v3_6_6/rabbitmq-server-3.6.6-1.el6.noarch.rpm
sudo rpm --import https://www.rabbitmq.com/rabbitmq-release-signing-key.asc
sudo yum install rabbitmq-server-3.6.6-1.el6.noarch.rpm
sudo /sbin/service rabbitmq-server start
sudo rabbitmq-plugins enable rabbitmq_management
sudo rabbitmqctl add_user myUsername myPassword
sudo rabbitmqctl set_user_tags myUsername administrator
sudo rabbitmqctl set_permissions -p / myUsername ".*" ".*" ".*"
