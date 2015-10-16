hostname        = "workspace.dev"

# UTC        for Universal Coordinated Time
# EST        for Eastern Standard Time
# US/Central for American Central
# US/Eastern for American Eastern
server_timezone  = "UTC"


# Set a local private network IP address.
# See http://en.wikipedia.org/wiki/Private_network for explanation
# You can use the following IP ranges:
#   10.0.0.1    - 10.255.255.254
#   172.16.0.1  - 172.31.255.254
#   192.168.0.1 - 192.168.255.254
server_ip             = "192.168.22.10"
server_cpus           = "1"   # Cores
server_memory         = "1024" # MB


Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.define "workspace" do |workspace|
  end

  config.vm.hostname = hostname

  # Create a static IP
  config.vm.network :private_network, ip: server_ip
  config.vm.network :forwarded_port, guest: 80, host: 8000

  # Use NFS for the shared folder
  config.vm.synced_folder ".", "/vagrant",
                          id: "core",
                          :nfs => true,
                          :mount_options => ['nolock,vers=3,udp,noatime']


  # If using VirtualBox
  config.vm.provider :virtualbox do |vb|
    vb.name = "Workspace"
    # Set server cpus
    vb.customize ["modifyvm", :id, "--cpus", server_cpus]

    # Set server memory
    vb.customize ["modifyvm", :id, "--memory", server_memory]

    # Set the timesync threshold to 10 seconds, instead of the default 20 minutes.
    # If the clock gets more than 15 minutes out of sync (due to your laptop going
    # to sleep for instance, then some 3rd party services will reject requests.
    vb.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000]
  end


  # Provision Base Packages
  config.vm.provision "shell", path: "provision/scripts/base.sh", args: [server_timezone]

  # Provision Nginx Packages
  config.vm.provision "shell", path: "provision/scripts/nginx.sh"


  # Provision Nodejs Packages
  config.vm.provision "shell", path: "provision/scripts/nodejs.sh"

  ## Provision NPM Packages
  config.vm.provision "shell", path: "provision/scripts/npm.sh"

  ## Provision Bower Packages
  config.vm.provision "shell", path: "provision/scripts/bower.sh"
  ## Provision Grunt Packages
  config.vm.provision "shell", path: "provision/scripts/grunt.sh"
  ## Provision Coffeescript Packages
  config.vm.provision "shell", path: "provision/scripts/coffeescript.sh"
  ## Provision Less Packages
  config.vm.provision "shell", path: "provision/scripts/less.sh"


  # Provision Ruby Packages
  config.vm.provision "shell", path: "provision/scripts/ruby.sh", privileged:false

  # Provision Ruby on Rails Packages
  config.vm.provision "shell", path: "provision/scripts/rails.sh", privileged:false

  # Provision Mysql
  config.vm.provision "shell", path: "provision/scripts/mysql.sh", privileged:false

  # Provision Redis
  config.vm.provision "shell", path: "provision/scripts/redis.sh", privileged:false

  # Provision Mongo Database
  config.vm.provision "shell", path: "provision/scripts/mongodb.sh", privileged:false


  # Provision Projects for this VM



end
