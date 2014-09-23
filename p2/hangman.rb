#!/usr/bin/env ruby
# Keevin Robbins
# krobbins
# Due 18 September, 2014

GUESSES = 10
guesses_remaining = GUESSES

word = NIL
guessed = Array.new
words = File.open("words", "r").to_a

puts "Please enter a number between 5 and 20."
range = gets.chomp.to_i

range = 5 if range < 5
range = 20 if range > 20

words.map!{ |word| word if word.length-1 == range}.compact!

while guesses_remaining > 0
  puts "You have #{guesses_remaining} guesses remaining."
  letter = gets.chars.first

  if guessed.include? letter
    puts "You already guessed #{letter}."
  else
    guessed.push letter
    newdict = words.map{ |word| word if !word.include? letter}.compact
    if newdict.empty? and word == NIL
      word = words[rand(words.length)].split("")
    else
      words = newdict
      if word == NIL or !word.include? letter
        guesses_remaining -= 1
      end
    end
    puts "Your word: "
    if word == NIL
      puts "_ " * range
    else
      total = 1
      for i in 0..word.length-2
        if guessed.include? word[i]
          print "#{word[i]} "
          total += 1
        else
          print "_ "
        end
      end
      if total == word.length
        puts
        puts "Congratulations!"
        puts "You win!"
        exit
      end
    end
    puts
    puts "Your guesses: "
    print guessed
    puts
  end
end

puts "Sorry!"
puts "You lose."
