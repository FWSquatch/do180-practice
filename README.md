# EX180 Automated Practice Deployment
_Powered by Ansible and Vagrant_ 

Install this system to complete [this EX180 Practice Exam](https://docs.google.com/document/d/e/2PACX-1vS-91bm_QXLo4oRy94wB0FPxzNk-yAhCs9gE2ljU9xjTGGtHmCXdc7TVBalhr59bl49-qZDJuSP0bDL/pub)

## Installation
1. Install vagrant and virtualbox.
2. [Install the Virtual Box Extension Pack](https://www.virtualbox.org/wiki/Downloads)
3. Clone this repo: `git clone https://github.com/FWSquatch/do180-practice`
4. Change into the newly created directory: `cd do180-practice`
5. Fire up the VMs: `vagrant up`

## Other Useful Information:
- `vagrant up` - Boots and provisions the environment
- `vagrant destroy -f` - Shuts down and destroys the environment
- `vagrant halt` - Only shuts down the environment VMs (can be booted up with `vagrant up`)
- `vagrant suspend` - Puts the VMs in a suspended state
- `vagrant resume` - Takes VMs out of a suspended state

You can also use the VirtualBox console to interact with the VMs or through a terminal. If you need to reset the root password, you would need to use the console. I'm constantly making upgrades to the environments, so every once and awhile run `git pull` in the repo directory to pull down changes. If you're using Windows, it's recommended to use Github Desktop so you can easily pull changes that are made to the environment. The first time you run the vagrant up command, it will download the OS images for later use. In other words, it will take longest the first time around but will be faster when it is deployed again. You can run `vagrant destroy -f` to destroy your environment at anytime. **This will erase everything**. This environment is meant to be reuseable, If you run the `vagrant up` command after destroying the environment, the OS image will already be downloaded and environment will deploy faster. Deployment should take around 15 minutes depending on your computer. You shouldn't need to access the IPA server during your practice exams. Everything should be provided that you would normally need during an actual exam. Hope this helps in your studies!

## Included systems:
- registry.do180.lab
- workstation.do180.lab

## System Details:
> workstation
- 192.168.88.4
- Gateway - 192.168.88.1
- DNS - 8.8.8.8
> registry
- 192.168.88.5
- Gateway - 192.168.88.1
- DNS - 8.8.8.8

## Accessing the systems
Remember to add the IP addresses to your local host file if you want to connect to the guest systems with the hostname.
Username - vagrant
Password - vagrant
- For root - use `sudo` or `sudo su`
Access example - `ssh vagrant@192.168.88.4` or `vagrant ssh workstation`
