# cookbooks/base/recipes/default.rb
package "git-core" do
  action :install
end

include_recipe "nginx::source"
vagrant provision

user node[:base][:user][:name] do
  home "/home/#{node[:base][:user][:name]}"
  shell node[:base][:user][:shell]
  supports :manage_home => true
end

directory "/home/#{node[:base][:user][:name]}/brigade" do
  owner node[:base][:user][:name]
end

file "/home/#{node[:base][:user][:name]}/brigade/index.html" do
  owner node[:base][:user][:name]
  content "<h1>Welcome, Ruby Brigade!</h1>"
end

template "#{node[:nginx][:dir]}/sites-available/brigade" do
  source "brigade.erb"
  mode 0644
end

nginx_site "brigade"