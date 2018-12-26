#!/usr/bin/env ruby

require_relative 'chronal_calibration'

chronal_calibration = ChronalCalibration.new
file = File.read('input.txt')

chronal_calibration.update(file)

puts "The awser is #{chronal_calibration.value}"
puts "The first frequency is #{chronal_calibration.first_frequency}"
