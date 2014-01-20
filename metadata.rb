name             'graylog2'
maintainer       'Stephan Oudmaijer'
maintainer_email 'soudmaijer@gmail.com'
license          'All rights reserved'
description      'Installs/Configures graylog2'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'


recipe "graylog2::default", "Installs and configures a graylog2 server"
recipe "graylog2::server", "Installs and configures a graylog2 server"
recipe "graylog2::web-interace", "Installs and configures a graylog2 web interface"

%w{ ubuntu debian }.each do |os|
  supports os
end

depends "ark"
depends "apt"
depends "java"
depends "elasticsearch"
depends "mongodb"