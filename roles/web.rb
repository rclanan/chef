# roles/web.rb
name "web"
description "Rails Web App"
run_list("recipe[base]")
override_attributes("nginx" => { "init_style" => "init" })