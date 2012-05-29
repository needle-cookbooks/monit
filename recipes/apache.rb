@service_name =  value_for_platform({
  [ "redhat","centos","scientific","fedora","suse","amazon" ] => "httpd",
  [ "debian","ubuntu"] => "apache2",
  [ "arch"] => "httpd",
  [ "freebsd" ] => "apache22"
})

monitrc 'apache' do
  service_name @service_name
end
