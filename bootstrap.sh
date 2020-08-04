cd ~

sudo apt-get -y update
sudo apt-get -y install gnupg2 curl git build-essential software-properties-common
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get -y update
sudo apt-get install -y gcc g++ gcc-6 g++-6 postgresql-10 libpq-dev redis-server imagemagick libmagickwand-dev libxml2-dev libxslt1-dev
sudo update-alternatives --remove-all gcc
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 80 --slave /usr/bin/g++ g++ /usr/bin/g++-6
sudo -u postgres createuser vagrant --superuser
sudo rm ~/mysql-apt-config_0.7.2-1_all.deb

# Install RVM
gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
source /home/vagrant/.rvm/scripts/rvm

# Install Ruby
rvm install 2.6.3
rvm use ruby-2.6.3
gem install bundler

# Setup RDL
echo "Installing RDL ..."
git clone https://github.com/mckaz/dsl-infer-rdl
cd rdl
gem build rdl.gemspec
gem install rdl-2.2.0.gem
cd ~

# Setup Discourse
echo "Installing ActiveMerchant..."
git clone https://github.com/mckaz/active_merchant_infer
cd active_merchant_infer
bundle install
cd ~
