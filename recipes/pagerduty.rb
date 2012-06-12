include_recipe	'python'

python_pip 'pagerduty'

data_bag_key = Chef::EncryptedDataBagItem.load_secret(node['data_bag_key'])
secrets = Chef::EncryptedDataBagItem.load("secrets", node.chef_environment, data_bag_key)

%w{trigger resolve}.each do |action|

	template "/etc/monit/pagerduty-#{action}" do
		source "pagerduty/pagerduty-#{action}.sh.erb"
		cookbook 'monit'
		mode 0750
		owner 'root'
		group 'root'
		variables({ :pagerduty_api_key => secrets['pagerduty_api_key'] })
	end

end