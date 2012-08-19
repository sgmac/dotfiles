#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'fileutils'
require 'pathname'

ROOT_DOTS = File.expand_path(File.dirname(__FILE__))

# Colors idea from http://blog.sosedoff.com/
class String
    # colorize functions
    def red; colorize(self, "\e[1m\e[31m");   end
    def green; colorize(self, "\e[1m\e[32m"); end
    def dark_green; colorize(self, "\e[32m"); end
    def yellow; colorize(self, "\e[1m\e[33m");end
    def blue; colorize(self, "\e[1m\e[34m");  end
    def dark_blue; colorize(self, "\e[34m");  end
    def pur; colorize(self, "\e[1m\e[35m");   end
    def colorize(text, color_code) "#{color_code}#{text}\e[0m" ; end
end

def unlink_all
  puts "Unlinking all files in #{ENV['HOME']}".red
  Dir["#{ENV['HOME']}/{*,.*}"].each do |file|
    File.unlink(file) if File.symlink?(file)
  end
end

def link_files(dotfiles)
  msg = ""
  dotfiles.each do |orig|
    color = "green"
    # Link content to Desktop
    if orig.count("/") > 1
      dest =  File.join(ENV['HOME'], ".#{orig.sub("desktop/","")}")
      parent = Pathname.new(dest).parent
      unless File.exist?(parent)
        FileUtils.mkdir_p(parent)
      end
    else
      dest = File.join(ENV['HOME'], ".#{File.basename(orig)}" )
    end
    if File.exists?(dest)
      begin
        File.unlink(dest)
      rescue Errno::EISDIR, Errno::EEXIST
        FileUtils.rm_rf(dest)
      end
    end
    puts "Link to "  + ".#{orig}#{msg}".send(color.to_s)
    File.symlink("#{ROOT_DOTS}/#{orig}","#{dest}")
  end
end

# Get directories and link
dotfolds = Dir["**"].reject {|file| ! File.directory?(file) }.sort

%w{ default desktop}.each do |dir|
  dotfolds.delete(dir)
end

default = Dir["default/*"]
desktop = Dir["desktop/**/*"].reject { |file|  File.directory?(file) }

unless ARGV[0].nil?
option = ARGV[0].downcase
  case option
  when "desktop"
    link_files desktop
  when "unlink"
    unlink_all
    exit 0
  end
end

link_files dotfolds
link_files default





