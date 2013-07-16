server {
  listen 80;
  server_name lvh.me;
  root /home/<%= @node[:base][:user][:name] %>/brigade;
}