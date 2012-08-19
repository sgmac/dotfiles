#!/usr/bin/env ruby

require 'rubygems'
require 'net/ssh'



HOST = 'sgmac.com'
USER = 'git'

Net::SSH.start(HOST,USER,:password => 'passwd') do |ssh|
  
  output = ssh.exec!("ls repos")
  mygits = output.split(/\n/)
  Dir.mkdir("repos") unless File.directory?("repos")
  Dir.chdir("repos") if File.exists?("repos")

  mygits.each do |g|
    url = "ssh://"  + USER + "@"  + HOST  + "/home" + "/"  + USER + "/repos" + "/" + g
    system "git clone #{url}"
  end
end


