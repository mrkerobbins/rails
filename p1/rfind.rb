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
tmp = `find .`
files = tmp.split("\n")
for i in 0..files.size - 1
  if files[i] =~ /.*#{Regexp.escape(ARGV[0])}.*[.]([r][b]|[e][r][b])|[j][s]|[c][s][s]|[h][t][m][l]|[y][m][l]|[t][x][t]/
    puts files[i]
  end
end
star_separator

puts "Files with content that matches <#{ARGV[0]}>"
tmp = `grep -r -i -n #{ARGV[0]}`
files = tmp.split("\n")
for i in 0..files.size - 1
  if files[i] =~ /.*#{Regexp.escape(ARGV[0])}.*[.]([r][b]|[e][r][b])|[j][s]|[c][s][s]|[h][t][m][l]|[y][m][l]|[t][x][t]/
    myfile = files[i].to_s
    path = myfile.slice(0, myfile.index(/[:]\d+[:]/))
    line_num = myfile.match(/[:]\d+[:]/)
    line_num = line_num.to_s.slice(1,line_num.length+1)
    puts "./#{path}"
    puts "  #{line_num}"
    dash_separator
  end
end
