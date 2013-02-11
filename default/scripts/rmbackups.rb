#!/usr/bin/env ruby

require 'find'
directories = []

pattern = /.*~$/
if ! ARGV.empty?  and ARGV.size > 1
  pattern = /#{ARGV.pop}/
end

directories = (ARGV.empty?) ? File.expand_path(File.dirname(__FILE__)) : ARGV
directories.each do |d|

  Find.find("#{d}") do |file|
    if file.match(pattern)
      if File.owned?("#{file}")
        puts "Deleting #{file}"
      	File.delete("#{file}")
      end
    end
    
  end	
end


