Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vm.box_check_update = false

  #config.vm.synced_folder ".","/vagrant",disabled: true

  config.vm.provider :virtualbox do |v|
    v.memory = 512
    v.linked_clone = true
  end

    # Image Registry
  config.vm.define "registry" do |registry|
    registry.vm.box = "geerlingguy/centos7"
    registry.vm.hostname = "registry.do180.lab"
    registry.vm.network :private_network, ip: "192.168.88.5"
    registry.vm.provision :shell, :inline => "sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config; sudo systemctl restart sshd;", run: "always"
    registry.vm.provision :shell, :inline => "yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y; sudo yum install -y sshpass python-pip python-devel ansible", run: "always"
    registry.vm.provision :shell, :inline => "sudo yum install -y sshpass python-pip python-devel ansible", run: "always"
    registry.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: ".git/"
  end
  
  # Workstation
  config.vm.define "workstation" do |workstation|
    workstation.vm.box = "geerlingguy/centos7"
    workstation.vm.hostname = "workstation.do180.lab"
    workstation.vm.network :private_network, ip: "192.168.88.4"
    workstation.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: ".git/"
    workstation.vm.provision :shell, :inline => "yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y; sudo yum install -y sshpass python-pip python-devel ansible", run: "always"
    workstation.vm.provision :shell, :inline => "sudo yum install -y sshpass python-pip python-devel ansible", run: "always"
    workstation.vm.provision :ansible_local do |ansible|
      ansible.playbook = "/vagrant/playbooks/master.yml"
      ansible.install = false
      ansible.compatibility_mode = "2.0"
      ansible.inventory_path = "/vagrant/inventory"
      ansible.config_file = "/vagrant/ansible.cfg"
      ansible.limit = "all"
  end
end
end
