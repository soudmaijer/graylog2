name             'graylog2'
maintainer       'Stephan Oudmaijer'
maintainer_email 'soudmaijer@gmail.com'
license          'All rights reserved'
description      'Installs/Configures graylog2'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.1'

recipe "graylog2::default", "Installs and configures a graylog2 server"
recipe "graylog2::server", "Installs and configures a graylog2 server"
recipe "graylog2::web-interface", "Installs and configures a graylog2 web interface"
recipe "graylog2::nginx", "Installs and configures nginx as reverse proxy for the web interface"

%w{ ubuntu debian redhat centos }.each do |os|
  supports os
end

depends "ark", "= 0.4.0"
depends "java", "= 1.14.0"
depends "elasticsearch", "= 0.3.7"
depends "mongodb", "= 0.14.6"
depends "nginx", "= 2.2.0"