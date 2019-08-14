date > /etc/vagrant_provisioned_at

curl -O https://storage.googleapis.com/golang/go1.9.1.linux-amd64.tar.gz
tar -xvf go1.9.1.linux-amd64.tar.gz
mv go /usr/local
rm  go1.9.1.linux-amd64.tar.gz
touch /home/vagrant/.bash_profile
echo "export PATH=$PATH:/usr/local/go/bin" >> /home/vagrant/.bash_profile
echo `export GOPATH=/home/vagrant/workspace:$PATH` >> /home/vagrant/.bash_profile
export GOPATH=/home/vagrant/workspace
mkdir -p "$GOPATH/bin" 

sudo apt-get install git -y

mkdir -p go/src/github.com/gorilla/
cd go/src/github.com/gorilla/
git clone https://github.com/gorilla/mux