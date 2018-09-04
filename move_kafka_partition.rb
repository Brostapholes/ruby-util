# frozen_string_literal: true
# !/usr/bin/env ruby

zk_connect = nil
available_brokers = []
zookeepers = []

# Searching for the zookeeper connection info
File.open('/opt/kafka/config/server.properties', "r") do |f|
  f.each_line do |line|
    if line.include?('zookeeper.connect=')
      zk_connect = line
      zk_connect.slice! 'zookeeper.connect='
    end
  end
end

# Creating the initial zookeeper array
zookeepers = zk_connect.split(',')

zookeepers.each do |g,h|
  if g.include? '/'
    h = g[/[^\/]+/]
    zookeepers.pop
    zookeepers.push(h)
  end
end
