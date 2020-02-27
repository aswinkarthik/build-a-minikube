$script = <<-'SCRIPT'
echo "I am provisioning"
sudo apt update -y
sudo apt install docker.io vim curl tree jq -y
cd /tmp/
wget https://storage.googleapis.com/kubernetes-release/release/v1.17.0/kubernetes-server-linux-amd64.tar.gz
tar xf kubernetes-server-linux-amd64.tar.gz
sudo mv kubernetes/server/bin/kubelet /usr/local/bin/
sudo mv kubernetes/server/bin/kubectl /usr/local/bin/
date > /etc/vagrant_provisioned_at
echo "Done provisioning at $(cat /etc/vagrant_provisioned_at)"
SCRIPT

Vagrant.configure("2") do |config|
	config.vm.provider "virtualbox"
	config.vm.box = "ubuntu/bionic64"
	config.vm.network "private_network", ip: "192.168.50.4"
	config.vm.provision "shell", inline: $script

	config.vm.synced_folder "resources/", "/src/"
	config.vm.hostname = "k8s-master"
end