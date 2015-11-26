
directory '/srv/teragen' do
  owner node['teragen']['user']
  group node['teragen']['group']
  mode '0755'
  action :create
end

script 'run_experiment' do
  cwd "/tmp"
  user node['teragen']['user']
  group node['teragen']['group']
  interpreter "bash"
  code <<-EOM

/srv/hadoop-2.4.0/bin/hadoop jar /srv/hadoop-2.4.0/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.4.0.jar teragen 100 /srv/teragen
  EOM
end

