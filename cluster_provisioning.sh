lines (13 sloc)  907 Bytes

#Install Consul
wget -O- --no-check-certificate https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
apt install -y consul

#Install Haproxy
apt install -y haproxy
systemctl enable haproxy

#Config Haproxy
curl https://github.com/fgarcesolivares/consul/blob/main/resources/haproxy.cfg --output /etc/haproxy/haproxy.cfg
curl https://github.com/fgarcesolivares/consul/blob/main/consul/resources/503sorry.http --output /etc/haproxy/errors/503sorry.http
service haproxy reload

#Create cluster
consul agent -ui -server -bootstrap-expect=1 -node=agent-server -bind=192.168.100.2 -client=0.0.0.0 -data-dir=/tmp/consul -config-dir=/etc/consul.d
