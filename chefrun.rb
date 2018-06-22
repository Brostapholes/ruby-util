#!/usr/bin/env ruby

# Clear Chef cache
Dir.chdir('/var/chef/cache') do
  Dir.glob('**/*').each { |file| File.delete(file) }
end

# Remove they ruby-build file
Dir.chdir('/usr/local/bin') do
  Dir.glob('ruby-build').each { |file| File.delete(file) }
end

# Run chef-client
system('chef-client')
