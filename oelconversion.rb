# frozen_string_literal: true

# !/usr/bin/env ruby

chef_dirs = []

# Create array of /var/chef/cache subdirectories
Dir.glob('/var/chef/cache/**/').each { |x| chef_dirs.push(x) }

# Clean up Chef Cache
chef_dirs.each do |x|
  Dir.chdir(x) do
    Dir.glob('*').each { |file| File.delete(file) }
  end
end

# Clean up Yum directory
Dir.chdir('/etc/yum.repos.d/') { Dir.glob('*.repo').each { |file| File.delete(file) } }

# Run chef-client
system('chef-client -o recipe[ets_base_os::oel_conversion')