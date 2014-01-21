# graylog2 cookbook

Cookbook for java/play based graylog2 server and web interface.

# Requirements

Tested the cookbook with virtualbox 4.3 and vagrant 1.4.3

# Usage

Run default recipe to install server with web interface.

# Attributes

# Recipes

recipe "graylog2::default", "Installs and configures a graylog2 server"
recipe "graylog2::server", "Installs and configures a graylog2 server"
recipe "graylog2::web-interace", "Installs and configures a graylog2 web interface"

# Author

Author:: Stephan Oudmaijer (soudmaijer@gmail.com)
