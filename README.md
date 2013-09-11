env
===

This repo contains various environments to utilize.

Initial environments available:
general
  dev
    includes environment, bash, screen, git, vim, and emacs configuration
    mongodb, postgresql
    vagrant with local, aws, azure, digitalocean management
    support ubuntu
    import ssh and certs
arduino
  dev
    will bring in the Arduino IDE and setup file tree
android
  dev
    will bring in Eclipse and setup file tree
node.js
  dev
    correct version of nvm, node.js/libraries
ruby
  dev
    correct ruby version, rails, cucumber, etc.

Utilize openly available recommended/example configurations, bash/emacs/vim
integration plus our sauce. To set versions, they are listed when required in 
the JSON for the environent. To create your own environment, pick the various 
environments required in the user_configuration.json and run the setup.sh.

TODO
  testing, staging, production environment variations (setup mongodb/postgresql
accurately).  Eclipse configurations and integration.  Python. Support OSX, 
android, windows/Visual Studio environments.Add xpra, automatic openvpn vpns. Setup for both dev VM creation and dev system for writing.
