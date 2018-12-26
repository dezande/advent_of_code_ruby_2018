require 'minitest/autorun'
require 'minitest/pride'
require_relative 'inventory_management_system'

class InventoryManagementSystemTest < Minitest::Test
  def test_first_example
    list_of_box = <<-HERODOC
      abcdef
      bababc
      abbcde
      abcccd
      aabcdd
      abcdee
      ababab
    HERODOC

    invertory = InventoryManagementSystem.new(list_of_box)

    assert 12, invertory.checksum
  end
end
