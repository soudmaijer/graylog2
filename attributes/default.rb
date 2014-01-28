default[:graylog2][:server_home] = '/opt/graylog2-server'
default[:graylog2][:server_user] = 'graylog2'
default[:graylog2][:server_group] = 'graylog2'
default[:graylog2][:server_package] = 'https://github.com/Graylog2/graylog2-server/releases/download/0.20.0-rc.1-1/graylog2-server-0.20.0-rc.1-1.tgz'
default[:graylog2][:server_password_secret] = "eepahkohd9ieliecaejienahkamohpucaengoisaipeileeghohquohsaijoorohpagheiboodahkeelahraxahmaejoujahifeb7imeyoingaeyiequucuugholaayaicheedaemunguvahgieghihahnailakahmeebeighahtieshahquiegoogaecailgah0aijahvaivaefeekopheilaeyothixepoxaiwieyohyeghiefiungomiesookahtaitootaitaipielahaighoomereehahl9upiixohxoorusiengoquooviuthekephidalaesoopeephiuquahhaingooroofenaediexoakohtheiceiseecahvaeeshob7poonooquohmaileniejateivaipahsaijahveleingooquushooxiiphoohufi" # You MUST set a secret to secure/pepper the stored user passwords here. Use at least 64 characters. Generate one by using for example: pwgen -s 96
default[:graylog2][:server_root_password_sha2] = "8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918" # admin Create one by using for example: echo -n admin | shasum -a 256
default[:graylog2][:server_rest_listen_uri] = "http://127.0.0.1:12900/"
default[:graylog2][:server_shards] = 1
default[:graylog2][:server_replicas] = 0
default[:graylog2][:server_max_indexes] = 10
default[:graylog2][:server_max_docs_per_index] = 20000000

default[:graylog2][:web_home] = '/opt/graylog2-web-interface'
default[:graylog2][:web_user] = 'graylog2-web'
default[:graylog2][:web_group] = 'graylog2'
default[:graylog2][:web_url] = 'http://localhost:9000'
default[:graylog2][:web_mem] = 256
default[:graylog2][:web_tz] = 'Europe/Amsterdam'
default[:graylog2][:web_package] = 'https://github.com/Graylog2/graylog2-web-interface/releases/download/0.20.0-rc.1-1/graylog2-web-interface-0.20.0-rc.1-1.tgz'

override[:java][:install_flavor] = "openjdk"
override[:java][:jdk_version] = "7"
override[:java][:openjdk_packages] = ["openjdk-7-jdk", "openjdk-7-jre-headless"]

override[:elasticsearch][:cluster][:name] = "graylog2"
override[:elasticsearch][:bootstrap][:mlockall] = "graylog2"
override[:elasticsearch][:allocated_memory] = "512m"

override[:nginx][:default_site_enabled] = false
