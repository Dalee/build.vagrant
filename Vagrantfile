Vagrant.require_version ">= 1.8.0"
Vagrant.configure("2") do |config|

	project_name = "baseimage"
	project_root = "/home/web/project"

	config.vm.box = "Dalee/ubuntu"
    config.vm.provider :virtualbox do |v|
        v.memory = 512
        v.cpus = 1
        v.gui = true
    end

	config.vm.network "private_network", type: "dhcp"
	config.vm.synced_folder ".", project_root, type: "nfs"
end
