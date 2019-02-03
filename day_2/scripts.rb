#!/usr/bin/env ruby

require_relative 'inventory_management_system'

file = File.read('input.txt')

puts "The checksum is #{InventoryManagementSystem.checksum(file)}"
puts "The letter commun is #{InventoryManagementSystem.find_letter_commun(file)}"
