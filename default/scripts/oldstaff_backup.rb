#!/usr/bin/env ruby
#
require 'fileutils'

IMAGES = '/var/www/oldstaff/shared/system'
BACKUPS = ENV['HOME'] + '/.backups/oldstaff'

# Mysql backup

FileUtils.mkdir_p("#{BACKUPS}") unless   File.exists?(BACKUPS)
Dir.mkdir("#{BACKUPS}/mysql")   unless   File.exists?("#{BACKUPS}/mysql")
Dir.mkdir("#{BACKUPS}/data")    unless   File.exists?("#{BACKUPS}/data")

dumpfile = "#{BACKUPS}/mysql/dump-#{Time.new.strftime("%d-%m-%Y")}.tar.bz2 "
mysql_dump = "mysqldump  -uoldstaff -pmonkey  oldstaff | bzip2 > #{dumpfile}"
system "#{mysql_dump}"

# Data Backup

tarfile = "#{BACKUPS}/data/attachments-#{Time.new.strftime("%d%m%Y")}.tar.bz2 "
tar_images = "tar jcPf  #{tarfile} #{IMAGES}"
system "#{tar_images}"

# Send to S3

mysql2S3 = "s3cmd put #{dumpfile} s3://oldstaff"
system "#{mysql2S3}"

