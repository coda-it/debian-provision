# Install genetic tools
sudo apt update
sudo apt install git

# Install docker
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common gnupg2
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce

# Install cear
mkdir -p ~/gowork/src/github.com/coda-it/cear
git clone https://github.com/coda-it/cear ~/gowork/src/github.com/coda-it
(cd ~/gowork/src/github.com/coda-it/cear && make)

cp ./cear.conf ~/gowork/src/github.com/coda-it/cear
cp ./deploy.sh ~/gowork/src/github.com/coda-it/cear
sudo sed -i "s/NOTIFICATION_URL/$NOTIFICATION_URL/g" ~/gowork/src/github.com/coda-it/cear/deploy.sh

sudo cp ./cear.service /etc/systemd/system
sudo sed -i "s/CEAR_KEY_VALUE/$CEAR_KEY_VALUE/g" /etc/systemd/system/cear.service
sudo systemctl daemon-reload
sudo systemctl start cear.service

# Create db space
sudo mkdir -p /root/db
