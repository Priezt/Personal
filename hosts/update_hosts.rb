#!/usr/bin/env ruby

require 'set'

#HOSTS = '/etc/hosts'
HOSTS = '/etc/hosts'
TMP_HOSTS = '/tmp/hosts.tmp'

if ARGV.length == 0
	raise 'Need hosts file name'
end

unless `whoami` =~ /root/
	raise 'Need root priviledge'
end

$hosts = {}
$hosts_new = Set.new

def load_hosts_file(f)
	return unless f =~ /(\w+)\.txt/i
	name = $1
	$hosts[name] = open(f).read.sub /\n+/, "\n"
	$hosts[name] = "# start %s\n" % name + $hosts[name] + "# end\n"
	$hosts_new << name
end

ARGV.each do |f|
	if File.exists? f
		load_hosts_file f
	else
		raise 'No such hosts file: %s' % f
	end
end

tmp_hosts_file = open TMP_HOSTS, 'w'
$started = false
$current_name = ''
open(HOSTS).each do |line|
	if $started
		if line =~ /^#\s+end\s*$/i
			$started = false
			STDERR.puts 'Update: %s' % $current_name
			tmp_hosts_file.print $hosts[$current_name]
			$hosts_new.delete $current_name
		end
	else
		if line =~ /^#\s+start\s+(.+)$/i
			if $hosts.include? $1
				$current_name = $1
				$started = true
			else
				tmp_hosts_file.puts line
			end
		else
			tmp_hosts_file.puts line
		end
	end
end
$hosts_new.each do |name|
	STDERR.puts 'Add: %s' % name
	tmp_hosts_file.puts ''
	tmp_hosts_file.print $hosts[name]
end
tmp_hosts_file.close

system 'cp %s %s' % [TMP_HOSTS, HOSTS]

