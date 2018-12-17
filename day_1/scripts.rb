#!/usr/bin/env ruby

require_relative 'chronal_calibration'

puts 'Run the first part'

chronal_calibration = ChronalCalibration.new
file = File.read('input.txt')

chronal_calibration.update(file)

puts "The awser for the first part is #{chronal_calibration.value}"
