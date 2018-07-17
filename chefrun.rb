# frozen_string_literal: true

# !/usr/bin/env ruby

require 'fileutils'

# Clear Chef cache
Dir['/var/chef/cache/*', '/etc/yum.repos.d/*'].each do |x|
  FileUtils.rm_rf(x, verbose: true)
end

# Remove they ruby-build file
FileUtils.rm_f('/usr/local/bin/ruby-build', verbose: true)

# Run chef-client
system('chef-client')
