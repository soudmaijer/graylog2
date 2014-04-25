# elasticsearch
override[:elasticsearch][:cluster][:name] = "graylog2"
override[:elasticsearch][:bootstrap][:mlockall] = "graylog2"
override[:elasticsearch][:allocated_memory] = "512m"
override[:elasticsearch][:plugins] = {"mobz/elasticsearch-head" => ""}

default[:graylog2][:server_version] = '0.20.1'
default[:graylog2][:server_home] = '/opt/graylog2-server'
default[:graylog2][:server_user] = 'graylog2'
default[:graylog2][:server_group] = 'graylog2'
default[:graylog2][:server_password_secret] = "eepahkohd9ieliecaejienahkamohpucaengoisaipeileeghohquohsaijoorohpagheiboodahkeelahraxahmaejoujahifeb7imeyoingaeyiequucuugholaayaicheedaemunguvahgieghihahnailakahmeebeighahtieshahquiegoogaecailgah0aijahvaivaefeekopheilaeyothixepoxaiwieyohyeghiefiungomiesookahtaitootaitaipielahaighoomereehahl9upiixohxoorusiengoquooviuthekephidalaesoopeephiuquahhaingooroofenaediexoakohtheiceiseecahvaeeshob7poonooquohmaileniejateivaipahsaijahveleingooquushooxiiphoohufi" # You MUST set a secret to secure/pepper the stored user passwords here. Use at least 64 characters. Generate one by using for example: pwgen -s 96
default[:graylog2][:server_root_password_sha2] = "8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918" # admin Create one by using for example: echo -n admin | shasum -a 256
default[:graylog2][:server_rest_listen_uri] = "http://127.0.0.1:12900/"
default[:graylog2][:server_is_master] = true
default[:graylog2][:server_shards] = 1
default[:graylog2][:server_replicas] = 0
default[:graylog2][:server_max_indexes] = 10
default[:graylog2][:server_max_docs_per_index] = 20000000
default[:graylog2][:server_mongodb_auth] = false
default[:graylog2][:server_mongodb_username] = "graylog2"
default[:graylog2][:server_mongodb_password] = "graylog2"
default[:graylog2][:server_mongodb_host] = '127.0.0.1'
default[:graylog2][:server_mongodb_database] = 'graylog2'
default[:graylog2][:server_mongodb_port] = '27017'

# Uncomment to use replica_set
# default[:graylog2][:server_mongodb_replica_set] = 'localhost:27017,localhost:27018,localhost:27019'
