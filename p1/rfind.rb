#!/usr/bin/env ruby
# Keevin Robbins
# CINS 465
# rfind.rb
# Due 9 September, 2014

def star_separator
  for i in 0..49
    print "*"
  end
  puts
end

def dash_separator
  for i in 0..49
    print "-"
  end
  puts
end

files = Array.new

puts "Files with names that matches <#{ARGV[0]}>"
files = `find . -name #{ARGV[0]}`
puts files
star_separator
puts "Files with content that matches <#{ARGV[0]}>"
files = `grep -r -i -n #{ARGV[0]}`
puts files
dash_separator
