# Introduction
This set of sample files started out as a direct clone of [the work by FWSquatch](https://github.com/FWSquatch/do180-practice). 

Their last update to the project was in March of 2021, with the sample exam environment still being based on ContOS 7. 

In the next few days/weeks, I will update this setup to work with a RHEL 8-like environment. 

## License

The original repository for the project did not include a license statement. 

I have taken the liberty of applying CC-BY-SA-4.0, for the time being. I will also contact the original author, to ask about their preferences.

## Walkthrough 

You will find an excellent walkthrough of the original DO180 sample exam, here: https://ziyonotes.uz/ex180-sample

## To Do list

The original DO180 sample exam lacks a few topics that are on the modern EX188 exam. 

I will soon add exercises (and walkthroughs) for the following topics:

* Podman Stacks
* Podman Secrets

# EX180 and EX188 Automated Practice Deployment
_Powered by Ansible and Vagrant_ 

Install this system to complete [this EX180 Practice Exam](https://docs.google.com/document/d/e/2PACX-1vS-91bm_QXLo4oRy94wB0FPxzNk-yAhCs9gE2ljU9xjTGGtHmCXdc7TVBalhr59bl49-qZDJuSP0bDL/pub)

## Installation
1. Install vagrant and virtualbox.
2. [Install the Virtual Box Extension Pack](https://www.virtualbox.org/wiki/Downloads)
3. Clone this repo: `git clone https://github.com/FWSquatch/do180-practice`
4. Change into the newly created directory: `cd do180-practice`
5. Fire up the VMs: `vagrant up`

Both VMs will take 1024MB of RAM, so make sure you have (at least) 2GB of RAM to spare.

## Other Useful Information:
- `vagrant up` - Boots and provisions the environment
- `vagrant destroy -f` - Shuts down and destroys the environment
- `vagrant halt` - Only shuts down the environment VMs (can be booted up with `vagrant up`)
- `vagrant suspend` - Puts the VMs in a suspended state
- `vagrant resume` - Takes VMs out of a suspended state

The first time you run the vagrant up command, it will download the OS images for later use. In other words, it will take longest the first time around but will be faster when it is deployed again. You can run `vagrant destroy -f` to destroy your environment at anytime. **This will erase everything**. 

This environment is meant to be reuseable, If you run the `vagrant up` command after destroying the environment, the OS image will already be downloaded and environment will deploy faster. 

You can work with either VM through SSH: open a terminal window on your host OS, "cd" into this Git repository and type "vagrant ssh registry", or "vagrant ssh workstation". 


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
