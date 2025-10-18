#-*- mode: ruby -*-
#vi: set ft=ruby :

Vagrant.configure("2") do |config|
	config.vm.box = "ubuntu/jammy64"
	config.vm.provider "virtualbox" do |vb|
		vb.memory="1024"
		vb.cpus = 1
	end

	config.vm.define "vm-db-master" do |master|
		master.vm.hostname = "vm-db-master"
		master.vm.network "private_network", ip: "192.168.56.10"
		master.vm.provider "virtualbox" do |vb|
			vb.name = "vm-db-master"
		end
	end

	config.vm.define "vm-db-replica" do |replica|
		replica.vm.hostname = "vm-db-replica"
		replica.vm.network "private_network", ip: "192.168.56.11"
		replica.vm.provider "virtualbox" do |vb|
			vb.name = "vm-db-replica"
		end
	end

	config.vm.define "vm-db-app" do |app|
		app.vm.hostname = "vm-db-app"
		app.vm.network "private_network", ip: "192.168.56.12"
		app.vm.network "forwarded_port",
			guest: 8080,
			host: 8080,
			host_ip: "0.0.0.0"

		app.vm.provider "virtualbox" do |vb|
			vb.name = "vm-db-app"
		end
	end
end
