Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "debian7_puppet"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/debian-70rc1-x64-vbox4210.box"
  # Installs Linux Header
  #config.vm.provision :shell, :inline => "sudo sh /home/vagrant/base.sh"
  # make an update of all sources so we could use newest list for puppet
  config.vm.provision :shell, :inline => "sudo sudo apt-get update"
  # install guest system on VM-Box but exits with erros, so cant use it here
  # config.vm.provision :shell, :inline => "sudo sh /home/vagrant/virtualbox.sh"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file = "default.pp"
    puppet.module_path = "modules"
    puppet.options = ['--verbose']
  end

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  config.vm.forward_port 80, 8080
  config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
  config.vm.share_folder "v-root", "/vagrant", "/data/p.lorenz/VirtualBoxVM/vagrant_template"
  config.vm.share_folder "v-data", "/var/www", "/data/p.lorenz/VirtualBoxVM/vagrant_template/www"

end
