#!/usr/bin/env ruby

%w(syslog).each {|c| require c }
BACKUP='/home/deploys/backups/mysql'

module SyslogMsg
  Syslog.open("rotatedb", Syslog::LOG_PID | Syslog::LOG_CONS ,  Syslog::LOG_LOCAL7 )
  def send(msg="Messagge sent")
    Syslog.log(Syslog::LOG_DEBUG, msg)
  end
end
include SyslogMsg
files = []

Dir.entries(BACKUP).each do |e|
  if e !~ /^\./
    files << e
  end
end
files.sort!

if files.length > 10
  0.upto(4) do |index|
    File.delete( BACKUP + "/" + files[index] )
  end
  SyslogMsg::send("Backups for mysql rotated.")
end



