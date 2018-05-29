#!/usr/bin/env ruby
require 'fileutils'

dirs = []

FileUtils.cd('/var/log/') do
  dirs.push(FileUtils.pwd)
  dirs.push(Dir.glob('/var/log/**/'))
  dirs.delete('/var/log')
end

dirs.each do |dir|
  FileUtils.cd(dir) do
    FileUtils.rm Dir.glob('*.gz'), force: true, verbose: true
    FileUtils.rm Dir.glob('*201*'), force: true, verbose: true
  end
end
