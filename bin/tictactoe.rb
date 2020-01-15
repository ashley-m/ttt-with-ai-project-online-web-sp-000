#!/usr/bin/env ruby

require_relative '../config/environment'

puts "Welcome to Tic Tac Toe!"
puts "Choose number of players"
players = gets.strip.to_i
if players < 0 || players > 2
  puts "Invalid input. Please choose a number 0-2"
  players = gets.strip.to_i
end
if players == 0
  game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
  game.play
elsif players == 1
  game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
  game.play
else
  game = Game.new(Players::Human.new("X"), Players::Human.new("O"))
  game.play
end
