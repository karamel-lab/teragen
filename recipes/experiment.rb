
directory '/srv/teragen' do
  owner node['wordcount']['user']
  group node['wordcount']['group']
  mode '0755'
  action :create
end

script 'run_experiment' do
  cwd "/tmp"
  user node['wordcount']['user']
  group node['wordcount']['group']
  interpreter "bash"
  code <<-EOM

/srv/hadoop/bin/hadoop jar /srv/hadoop-2.4.0/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.4.0.jar teragen 10 /srv/teragen
  EOM
end

