Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vm.box_check_update = false

    # Image Registry
  config.vm.define "registry" do |registry|
    registry.vm.box = "almalinux/8"
    registry.vm.hostname = "registry.do180.lab"
    registry.vm.network :private_network, ip: "192.168.88.5"
    registry.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: ".git/"

    registry.vm.provision :shell, :inline => "sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config; sudo systemctl restart sshd;", run: "always"
    registry.vm.provision :shell, :inline => "yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y; sudo yum install -y sshpass ansible", run: "always"

  end
  
  # Workstation
  config.vm.define "workstation" do |workstation|
    workstation.vm.box = "almalinux/8"
    workstation.vm.hostname = "workstation.do180.lab"
    workstation.vm.network :private_network, ip: "192.168.88.4"
    workstation.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: ".git/"

    workstation.vm.provision :shell, :inline => "sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config; sudo systemctl restart sshd;", run: "always"
    workstation.vm.provision :shell, :inline => "yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y; sudo yum install -y sshpass ansible", run: "always"

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
