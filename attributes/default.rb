default[:graylog2][:server_home] = '/opt/graylog2-server'
default[:graylog2][:server_user] = 'graylog2'
default[:graylog2][:server_group] = 'graylog2'
default[:graylog2][:server_package] = 'https://github.com/Graylog2/graylog2-server/releases/download/0.20.0-rc.1/graylog2-server-0.20.0-rc.1.tgz'
default[:graylog2][:server_password_secret] = "" # You MUST set a secret to secure/pepper the stored user passwords here. Use at least 64 characters. Generate one by using for example: pwgen -s 96
default[:graylog2][:server_root_password_sha2] = "" # Create one by using for example: echo -n yourpassword | shasum -a 256
default[:graylog2][:server_rest_listen_uri] = "http://127.0.0.1:12900/"
default[:graylog2][:server_shards] = 1
default[:graylog2][:server_replicas] = 0
default[:graylog2][:server_max_indexes] = 10
default[:graylog2][:server_max_docs_per_index] = 20000000

default[:graylog2][:web_home] = '/opt/graylog2-web-interface'
default[:graylog2][:web_user] = 'graylog2-web'
default[:graylog2][:web_group] = 'graylog2'
default[:graylog2][:web_tz] = 'Europe/Amsterdam'
default[:graylog2][:web_package] = 'https://github.com/Graylog2/graylog2-web-interface/releases/download/0.20.0-rc.1/graylog2-web-interface-0.20.0-rc.1.tgz'

override[:java][:install_flavor] = "openjdk"
override[:java][:jdk_version] = "7"

override[:elasticsearch][:cluster][:name] = "graylog2"
override[:elasticsearch][:bootstrap][:mlockall] = "graylog2"
