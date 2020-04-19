#!/bin/env ruby

require 'fileutils'

#Stoo Kafka Process

# Clear Kafka logs
Dir['/var/db/kafka/*'].each do |x|
	FileUtils.rm_rf(x, verbose: true)
end

# Clear Chef cache
Dir['/var/chef/cache/*'].each do |x|
	FileUtils.rm_rf(x, verbose: true)
end

# Remove they ruby-build file
FileUtils.rm_f('/usr/local/bin/ruby-build', verbose: true)
