name                                    'graylog2'
maintainer                              'Stephan Oudmaijer'
maintainer_email                        'soudmaijer@gmail.com'
license                                 'Apache License, Version 2.0'
description                             'Installs/Configures graylog2'
long_description                        IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version                                 '1.1.0'

recipe 'graylog2::default',             'Installs and configures a graylog2 server'
recipe 'graylog2::server',              'Installs and configures a graylog2 server with Java, ElasticSearch and single MongoDB instance'
recipe 'graylog2::server-only',         'Installs and configures a graylog2 server'
recipe 'graylog2::web-interface',       'Installs and configures a graylog2 web interface with Java'
recipe 'graylog2::web-interface-only',  'Installs and configures a graylog2 web interface'
recipe 'graylog2::nginx',               'Installs and configures nginx as reverse proxy for the web interface'

%w{ ubuntu debian redhat centos }.each do |os|
  supports os
end

depends 'ark',                          '~> 0.8.0'
depends 'java',                         '~> 1.22.0'
depends 'elasticsearch',                '~> 0.3.8'
depends 'mongodb',                      '~> 0.14.8'
depends 'nginx',                        '~> 2.2.0'
