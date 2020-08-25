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
echo 'HERE 1'
#gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
#curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -sSL https://rvm.io/mpapis.asc | gpg --batch --import -; \
echo 409B6B1796C275462A1703113804BB82D39DC0E3:6: | gpg --batch --import-ownertrust; \
# piotr.kuczynski@gmail.com
curl -sSL https://rvm.io/pkuczynski.asc | gpg --batch --import -; \
echo 7D2BAF1CF37B13E2069D6956105BD0E739499BDB:6: | gpg --batch --import-ownertrust
echo 'HERE 2'
curl -sSL https://get.rvm.io | bash -s stable
echo 'HERE 3'
source /home/vagrant/.rvm/scripts/rvm
echo 'HERE 4'

# Install Ruby
rvm install 2.6.3
rvm use ruby-2.6.3
gem install bundler

# Setup RDL
echo "Installing RDL ..."
git clone https://github.com/mckaz/dsl-infer-rdl
cd dsl-infer-rdl
gem build rdl.gemspec
gem install rdl-2.2.0.gem
cd ~

# Setup ActiveMerchant
echo "Installing ActiveMerchant..."
git clone https://github.com/mckaz/active_merchant_infer
cd active_merchant_infer
bundle install
gem build activemerchant.gemspec
gem install activemerchant-1.103.0.gem
cd ~

echo "Installing Diff-LCS..."
git clone https://github.com/mckaz/diff-lcs-infer.git
cd diff-lcs-infer
bundle install
gem build diff-lcs.gemspec
gem install diff-lcs-1.4.gem
cd ~

echo "Installing Minimagick..."
git clone https://github.com/mckaz/minimagick-infer.git
cd minimagick-infer
bundle install
gem build mini_magick.gemspec
gem install mini_magick-4.10.1.gem
cd ~

echo "Installing Optcarrot..."
git clone https://github.com/mckaz/optcarrot-infer.git
cd optcarrot-infer
bundle install
gem build optcarrot.gemspec
gem install optcarrot-0.9.0.gem
cd ~

echo "Installing Sidekiq..."
git clone https://github.com/mckaz/sidekiq-infer.git
cd sidekiq-infer
bundle install
gem build sidekiq.gemspec
gem install sidekiq-6.0.4.gem
cd ~

echo "Installing TZInfo..."
git clone https://github.com/mckaz/tzinfo-infer.git
cd tzinfo-infer
bundle install
gem build tzinfo.gemspec
gem install tzinfo-2.0.0.gem
cd ~
