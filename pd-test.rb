#!/usr/bin/env ruby
require 'socket'
s = TCPSocket.new "localhost", 9002
s.puts "/Users/pete/Dropbox/Catshrine_Videos/20150715201115.mov"
s.puts "/Users/pete/Dropbox/Catshrine_Videos/20150715203811.mov"
s.close
