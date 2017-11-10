#!/usr/bin/ruby
File.open("2017-2018-usernames-passwords.csv").each do |line|
  line = line.split ","
  username = line[0]
  password = line[-1]
  puts "#{username} #{password}"
end

puts "Hit enter to reset all passwords."
gets

File.open("2017-2018-usernames-passwords.csv").each do |line|
  line = line.split ","
  username = line[0].strip.gsub("$", "\\$")
  password = line[-1].strip.gsub("$", "\\$")
  puts "echo '#{username}:#{password}' | chpasswd"
  `echo "#{username}:#{password}" | chpasswd`
end
