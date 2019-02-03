require 'set'

class InventoryManagementSystem
  attr_reader :boxes

  class << self
    def two_letter?(input)
      new.two_letter?(input)
    end

    def three_letter?(input)
      new.three_letter?(input)
    end

    def checksum(input)
      new(input).checksum
    end

    def find_letter_commun(input)
      new(input).find_letter_commun
    end
  end

  def initialize(input = nil)
    @boxes = input.lines.map(&:strip) unless input.nil?
  end

  def checksum
    boxes.count { |box| two_letter?(box) } *
      boxes.count { |box| three_letter?(box) }
  end

  def two_letter?(box)
    box.chars.any? { |char| box.count(char) == 2 }
  end

  def three_letter?(box)
    box.chars.any? { |char| box.count(char) == 3 }
  end

  def find_letter_commun
    boxes.first.length.times do |column|
      boxes.each_with_object(Set.new) do |box, memo|
        id = box[0...column] + box[(column + 1)..-1]
        return id if memo.include?(id)

        memo << id
      end
    end
  end
end
