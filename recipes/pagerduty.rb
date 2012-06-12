include_recipe	'python'

python_pip 'pagerduty'

%w{trigger resolve}.each do |action|

	template "/etc/monit/pagerduty-#{action}" do
		source "pagerduty/pagerduty-#{action}.sh.erb"
		cookbook 'monit'
		mode 0750
		owner 'root'
		group 'root'
		variables({ :pagerduty_api_key => node[:monit][:pagerduty_api_key] })
	end

end