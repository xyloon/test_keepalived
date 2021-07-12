# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

$install_keepalived = <<-SCRIPT
  apt update
  apt install -y keepalived
SCRIPT

nodes = [
  { :hostname => 'm1', :ip => '10.20.30.43', :network_bridge_device => ENV['NETWORK_BRIDGE_DEVICE'], :box => 'ubuntu/focal64' ,
    :hw_req => { :cpus => 1, :memory => 1024 },
    :provisions => [
      { :type => "inline_script", :inline => $install_keepalived},
      { :type => "file", :source => "keepalived_config.sh", :destination => "/usr/bin/keepalived_config.sh"},
      { :type => "shell_script", :path => "/usr/bin/keepalived_config.sh", :args => "MASTER 40 110 10.20.30.43 10.20.30.42"}
    ]
  },
  { :hostname => 'm2', :ip => '10.20.30.44', :network_bridge_device => ENV['NETWORK_BRIDGE_DEVICE'], :box => 'ubuntu/focal64' ,
    :hw_req => { :cpus => 1, :memory => 1024 },
    :provisions => [
      { :type => "inline_script", :inline => $install_keepalived}
      { :type => "file", :source => "keepalived_config.sh", :destination => "/usr/bin/keepalived_config.sh"},
      { :type => "shell_script", :path => "/usr/bin/keepalived_config.sh", :args => "SLAVE 40 110 10.20.30.44 10.20.30.42"}
    ]
  },
  { :hostname => 'm3', :ip => '10.20.30.45', :network_bridge_device => ENV['NETWORK_BRIDGE_DEVICE'], :box => 'ubuntu/focal64' ,
    :hw_req => { :cpus => 1, :memory => 1024 },
    :provisions => [
      { :type => "inline_script", :inline => $install_keepalived}
      { :type => "file", :source => "keepalived_config.sh", :destination => "/usr/bin/keepalived_config.sh"},
      { :type => "shell_script", :path => "/usr/bin/keepalived_config.sh", :args => "SLAVE 40 110 10.20.30.45 10.20.30.42"}
    ]
  },
]
eval File.read("./Vagrantfile-common")

