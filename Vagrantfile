# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
	if Vagrant.has_plugin? "vagrant-vbguest"
		config.vbguest.no_install = true
		config.vbguest.auto_update = false
		config.vbguest.no_remote = true
	end

	config.vm.define :cluster do |cluster|
		cluster.vm.box = "bento/ubuntu-20.04"
		cluster.vm.network :private_network, ip: "192.168.100.2"
		cluster.vm.hostname = "cluster"
		#cluster.vm.provision "file", source: "cluster.yml", destination: "/tmp/cluster.yml"
		cluster.vm.provision :shell, path: "cluster_provisioning.sh"
	end

	config.vm.define :web1 do |web1|
		web1.vm.box = "bento/ubuntu-20.04"
		web1.vm.network :private_network, ip: "192.168.100.3"
		web1.vm.hostname = "web1"
		#web1.vm.provision :shell, path: "node_provisioning.sh"
	end

	config.vm.define :web2 do |web2|
		web2.vm.box = "bento/ubuntu-20.04"
		web2.vm.network :private_network, ip: "192.168.100.4"
		web2.vm.hostname = "web2"
	end
end