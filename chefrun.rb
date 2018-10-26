# !/usr/bin/env ruby

require "chef"
require "chef/application/client"
require 'fileutils'

# Clear Chef cache
Dir['/var/chef/cache/*'].each do |x|
  FileUtils.rm_rf(x, verbose: true)
end

# Remove they ruby-build file
FileUtils.rm_f('/usr/local/bin/ruby-build', verbose: true)

# Run chef-client
Chef::Application::Client.new.run
