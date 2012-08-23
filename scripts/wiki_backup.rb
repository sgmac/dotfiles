#!/usr/bin/env ruby

require 'date'

# Backup 
wiki_path = '/var/www/wiki/data'
date      = DateTime.now.strftime("%d-%m-%Y")
name      = 'wiki_data_backup'
tmpdir    = '/tmp'
exclude_dirs =  "cache"
file = "#{tmpdir}/#{name}-#{date}.tar.gz"

# Logs
#
logfile = ENV['HOME'] + '/.logs/wiki_backup.s3'
log = File.open("#{logfile}","a") 

# Command

if File.exists?("#{file}")
       	log.write("#{date} Backup already performed [SKIP]\n") 
	log.close
	exit
end

cmd = "tar czP --exclude=#{exclude_dirs} -f #{file} #{wiki_path} "
system("#{cmd}")

if $? == 0
	s3 = "s3cmd put #{file} s3://idunwikibackup"
	system("#{s3}")
	if $? == 0
			log.write("#{date} Backup done....[OK]\n")
	end

end

log.close

