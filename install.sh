# Install genetic tools
sudo apt update
sudo apt install git
mkdir -p ~/gowork/src/github.com/coda-it

# Install cear
git clone https://github.com/coda-it/cear ~/gowork/src/github.com/coda-it
(cd ~/gowork/src/github.com/coda-it && make)

cp ./cear.conf ~/gowork/src/github.com/coda-it/cear
cp ./deploy.sh ~/gowork/src/github.com/coda-it/cear
sudo sed -i "" "s/NOTIFICATION_URL.*/$(NOTIFICATION_URL)/g" ~/gowork/src/github.com/coda-it/cear/deploy.sh

sudo cp ./cear.service /etc/systemd/system
sudo sed -i "" "s/CEAR_KEY_VALUE.*/$(CEAR_KEY_VALUE)/g" /etc/systemd/system/cear.service
sudo systemctl daemon-reload
sudo systemctl start cear.service