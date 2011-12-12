#!/usr/bin/env ruby

require 'tk'

minutes = ARGV[0].to_i
msg = ARGV[1]

puts "Wait for %d minutes..." % minutes
sleep minutes * 60

Tk.messageBox(
	'type' => 'ok',
	'icon' => 'info',
	'title' => 'alert',
	'message' => msg
)
