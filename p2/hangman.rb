#!/usr/bin/env ruby
# Keevin Robbins
# krobbins
# Due 18 September, 2014

GUESSES = 10
words=File.open("words", "r")

guesses_remaining = GUESSES
guess = Array.new
already_guessed = Array.new

puts "Enter a word length between 5 and 20."
range = gets.chomp.to_i

if range < 5
  range = 5
elsif range > 20
  range = 20
end

while guesses_remaining > 0
  puts "Enter your guess, sucker."
  guess = gets.chars.first
  if already_guessed.find_index(guess) != NIL
    puts "Stop repeating guesses."
  else
    already_guessed.push(guess).sort!
    print "#{already_guessed} "
    guesses_remaining -= 1
    puts guesses_remaining
  end
end
