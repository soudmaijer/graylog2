include_recipe "nginx::default"

template "#{node.nginx.dir}/sites-available/graylog2-web-interface.conf" do
  source "nginx.conf.erb"
  mode "0644"
end

nginx_site "graylog2-web-interface.conf"