sudo apt-get install -y ruby-dev #needed to complete ruby as ubuntu is stupid
sudo apt-get install -y libxslt-dev #needed for nokogiri to build

#rvm install and force 2.0.0
gem install rvm
#set version to 2.0
source /usr/local/rvm/scripts/rvm
rvm use ruby-2.0.0-p247

#gems to install:
gem install rails
gem install nokogiri capybara
gem install cucumber gherkin
gem install rspec
gem install poltergeist
gem install mongo
gem install cassandra
gem install pg

#https://github.com/tpope/vim-rails
#http://www.emacswiki.org/emacs/RubyMode
#http://www.emacswiki.org/emacs/RubyOnRails
