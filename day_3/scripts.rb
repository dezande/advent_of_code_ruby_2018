#!/usr/bin/env ruby

require_relative 'no_matter_how_you_slice_it'

file = File.read('input.txt')
no_matter_how_you_slice_it = NoMatterHowYouSliceIt.new(file)

puts "The awser is #{no_matter_how_you_slice_it.square_inches}"
