require 'minitest/autorun'
require 'minitest/pride'
require_relative 'inventory_management_system'

# Test InventoryManagementSystem
class InventoryManagementSystemTest < Minitest::Test
  def test_example_with_no_two_or_three
    input = 'abcdef'
    refute InventoryManagementSystem.two_letter?(input)
    refute InventoryManagementSystem.three_letter?(input)
  end

  def test_example_with_two_and_three
    input = 'bababc'
    assert InventoryManagementSystem.two_letter?(input)
    assert InventoryManagementSystem.three_letter?(input)
  end

  def test_example_with_two_but_not_three
    input = 'abbcde'
    assert InventoryManagementSystem.two_letter?(input)
    refute InventoryManagementSystem.three_letter?(input)
  end

  def test_example_with_three_but_not_two
    input = 'abcccd'
    refute InventoryManagementSystem.two_letter?(input)
    assert InventoryManagementSystem.three_letter?(input)
  end

  def test_example_with_three_and_two
    input = 'aabcdd'
    assert InventoryManagementSystem.two_letter?(input)
    refute InventoryManagementSystem.three_letter?(input)
  end

  def test_example_2_with_two_and_not_three
    input = 'abcdee'
    assert InventoryManagementSystem.two_letter?(input)
    refute InventoryManagementSystem.three_letter?(input)
  end

  def test_example_2_with_three_and_not_two
    input = 'abcdee'
    assert InventoryManagementSystem.two_letter?(input)
    refute InventoryManagementSystem.three_letter?(input)
  end

  def test_checksum
    input = <<-HEREDOC
      abcdef
      bababc
      abbcde 
      abcccd
      aabcdd
      abcdee
      ababab
    HEREDOC

    assert_equal 12, InventoryManagementSystem.checksum(input)
  end
end
