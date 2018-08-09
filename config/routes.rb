=begin
Topological Inventory

Topological Inventory

OpenAPI spec version: 0.0.1
Contact: you@your-company.com
Generated by: https://github.com/swagger-api/swagger-codegen.git

=end
Rails.application.routes.draw do

  def add_swagger_route http_method, path, opts = {}
    full_path = path.gsub(/{(.*?)}/, ':\1')
    match full_path, to: "#{opts.fetch(:controller_name)}##{opts[:action_name]}", via: http_method
  end

  add_swagger_route 'POST', '/Fryguy/topological_inventory/0.0.1/providers', controller_name: 'admins', action_name: 'add_provider'
  add_swagger_route 'GET', '/Fryguy/topological_inventory/0.0.1/providers', controller_name: 'users', action_name: 'list_providers'
end