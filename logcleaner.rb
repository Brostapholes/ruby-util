# !/usr/bin/env ruby

require 'zlib'

dirs = []
safiles = []

# Create array of /var/log subdirectories
Dir.glob('/var/log/**/').each do |x|
  dirs.push(x)
end

# Clean up files in the /var/log directory and subdirectories
dirs.each do |dir|
  Dir.chdir(dir) do
    Dir.glob('*.gz').each { |file| File.delete(file) }
    Dir.glob('*.old').each { |file| File.delete(file) }
    Dir.glob('*201*').each { |file| File.delete(file) }
  end
end
# Array of files in /var/log/sa
Dir.glob('/var/log/sa/*').each do |x|
  safiles.push(x)
end

# SA Files cleanup
Dir.chdir('/var/log/sa') do
  safiles.each do |y|
    gz = "#{y}.gz"
    Zlib::GzipWriter.open(gz) do |z|
      z.write File.read(y)
    end
    File.delete(y)
  end
end
