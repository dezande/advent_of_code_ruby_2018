require 'minitest/autorun'
require 'minitest/pride'
require_relative 'box'

class BoxTest < Minitest::Test
  def test_box_1
    box = Box.new('abcdef')
    refute box.includes_2_letters_identical?
    refute box.includes_3_letters_identical?
  end

  def test_box_2
    box = Box.new('bababc')
    assert box.includes_2_letters_identical?
    assert box.includes_3_letters_identical?
  end

  def test_box_3
    box = Box.new('abbcde')
    assert box.includes_2_letters_identical?
    refute box.includes_3_letters_identical?
  end

  def test_box_4
    box = Box.new('abcccd')
    refute box.includes_2_letters_identical?
    assert box.includes_3_letters_identical?
  end

  def test_box_5
    box = Box.new('aabcdd')
    assert box.includes_2_letters_identical?
    refute box.includes_3_letters_identical?
  end

  def test_box_6
    box = Box.new('abcdee')
    assert box.includes_2_letters_identical?
    refute box.includes_3_letters_identical?
  end

  def test_box_7
    box = Box.new('ababab')
    refute box.includes_2_letters_identical?
    assert box.includes_3_letters_identical?
  end
end
