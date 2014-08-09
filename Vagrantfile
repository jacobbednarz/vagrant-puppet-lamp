Vagrant.configure('2') do |config|
  # Define the base box to build off.
  config.vm.box     = 'precise64'
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'

  # Create the webroot directory if it doesn't exist. To prevent file permission
  # woes, we'll set the 'webroot' directory to be pretty open.
  Dir.mkdir './webroot' unless Dir.exist? './webroot'
  File.chmod(0777, './webroot')

  # Enable the Puppet provisioner and point it at the respective directories.
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'manifests'
    puppet.manifest_file  = 'default.pp'
    puppet.module_path    = 'modules'
  end

  # Forward guest port 80 to host port 8888 and name mapping.
  config.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true
  config.vm.synced_folder 'webroot/', '/vagrant/webroot/'
end
