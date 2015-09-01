#!/usr/bin/env ruby

require 'socket'
require 'osax'
include OSAX

app = ENV["HOME"] + "/popnlock/"
data = ENV["HOME"] + "/popnlock-data/"
output = ENV["HOME"] + "/Dropbox/Catshrine_Videos/"
project = "XXX"
framerate = 8
loops = 4


production = Dir.glob(data + "*.dgn").sort_by { |f| File.mtime(f) }[-1]

scene = production.split("_")[1].split(".")[0]
path = "#{production}/#{project}_#{scene}_Take_01/#{project}_#{scene}_01_X1/"

images = Dir.entries(path)
images.delete_at(2)
images = images.select { |f| File.file?(path + f)}
images = images.sort_by { |f| File.mtime(path + f) }

frames = osax.display_dialog("How many frames?", :default_answer => "8")[:text_returned].to_i

start = images[-frames][14,4]

timestamp = Time.now.strftime("%Y%m%d%H%M%S")

`ffmpeg -loop 1 -t #{(1/framerate.to_f) * frames * loops} -framerate #{framerate} -start_number #{start} -i "#{path}#{project}_#{scene}_01_X1_%04d.tiff" #{output + timestamp}.mov`

s = TCPSocket.new "localhost", 9002
s.puts "#{output + timestamp}.mov"
s.close

# videos = Dir.entries(output)
# videos.delete_at(2)
# videos = videos.select { |f| File.file?(output + f)}
# videos = videos.sort_by { |f| File.mtime(output + f) }
# videos = videos.last(8)
# videos = videos.reverse
#
# File.open(app + "playlist", "w") do |f|
#   videos.each { |element| f.puts(output + element) }
# end
#
# `echo 'loadlist playlist 0' >> ~/popnlock/whip`
