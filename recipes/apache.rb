@service_name =  value_for_platform({
  [ "redhat","centos","scientific","fedora","suse","amazon" ] => { "default" => "httpd" },
  [ "debian","ubuntu"] => { "default" => "apache2" },
  [ "arch" ] => { "default" =>  "httpd" },
  [ "freebsd" ] => { "default" => "apache22" }
})

monitrc 'apache' do
  service_name @service_name
end
