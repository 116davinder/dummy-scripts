Vagrant.configure("2") do |config|

######################### ansible-controller node
  config.vm.define "controller" do |controller|
    controller.vm.box = "geerlingguy/centos7"
    controller.vm.hostname = "controller"
    controller.vm.network :private_network, ip: "192.168.56.100"
    controller.vm.provision "shell",
      inline: "sudo yum install ansible -y"
  end

##################### Setting CPU and Memory for All machines
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "1024"
    vb.cpus =  1
  end

####################### Sharing Folder with machines
  config.vm.synced_folder ".", "/home/vagrant/projects", type: "nfs"
  config.ssh.insert_key = false

end