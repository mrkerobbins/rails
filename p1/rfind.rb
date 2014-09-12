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
last_path = 0

puts "Files with names that matches <#{ARGV[0]}>"
tmp = `find .`
files = tmp.split("\n")
files.sort!
for i in 0..files.size - 1
  if files[i] =~ /.*#{ARGV[0]}.*[.]([h][t][m][l]|[r][b]|[e][r][b]|[j][s]|[c][s][s]|[y][m][l]|[t][x][t])/
    puts "  #{files[i]}"
  end
end
star_separator

puts "Files with content that matches <#{ARGV[0]}>"
tmp = `egrep -r -i -n #{ARGV[0]}`
files = tmp.split("\n")
# a loop that uses .map to set a new array of the matches before formatting the 
# string output and printing it might work wonders here.
for i in 0..files.size - 1
  if files[i] =~ /.*[.]([h][t][m][l]|[r][b]|[e][r][b]|[j][s]|[c][s][s]|[y][m][l]|[t][x][t])/
    myfile = files[i].to_s
    path = myfile.slice(0, myfile.index(/[:]\d+[:]/))
    line_num = myfile.slice(myfile.index(/[:]\d+[:]/)+1, myfile.length)
    if last_path == 0
      puts "./#{path}"
      puts "  #{line_num}"
    elsif path != last_path
      dash_separator
      puts "./#{path}"
      puts "  #{line_num}"
    else
      puts "  #{line_num}"
    end
    last_path = path
  end
end
