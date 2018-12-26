require_relative 'box'

class InventoryManagementSystem
  def initialize(list_of_box)
    @list_of_box = list_of_box.lines.map do |box|
      Box.new(box)
    end
  end

  def checksum
    exactly_2_letters * exactly_3_letters
  end

  private

  attr_reader :list_of_box

  def exactly_2_letters
    list_of_box.count(&:includes_2_letters_identical?)
  end

  def exactly_3_letters
    list_of_box.count(&:includes_3_letters_identical?)
  end
end
