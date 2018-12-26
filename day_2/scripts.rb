#!/usr/bin/env ruby

require_relative 'inventory_management_system'

file = File.read('input.txt')
inventory = InventoryManagementSystem.new(file)

puts "The checksum is #{inventory.checksum}"
