require 'minitest/autorun'
require 'minitest/pride'
require_relative 'chronal_calibration'

# Test for Chronal Calibration
class ChronalCalibrationTest < Minitest::Test
  def test_a_default_value
    assert_equal 0, ChronalCalibration.new.value
  end

  def test_a_value_imposed
    assert_equal 5, ChronalCalibration.new(5).value
  end

  def test_first_single_value_update
    chronal_calibration = ChronalCalibration.new(0)
    chronal_calibration.update('+1')
    assert_equal 1, chronal_calibration.value
  end

  def test_second_single_value_update
    chronal_calibration = ChronalCalibration.new(1)
    chronal_calibration.update('-2')
    assert_equal -1, chronal_calibration.value
  end

  def test_third_single_value_update
    chronal_calibration = ChronalCalibration.new(-1)
    chronal_calibration.update('+3')
    assert_equal 2, chronal_calibration.value
  end

  def test_last_single_value_update
    chronal_calibration = ChronalCalibration.new(2)
    chronal_calibration.update('+1')
    assert_equal 3, chronal_calibration.value
  end

  def test_first_multi_value_update
    frequencies = <<-HEREDOC
      +1
      +1
      +1
    HEREDOC

    chronal_calibration = ChronalCalibration.new
    chronal_calibration.update(frequencies)
    assert_equal 3, chronal_calibration.value
  end

  def test_second_multi_value_update
    frequencies = <<-HEREDOC
      +1
      +1
      -2
    HEREDOC

    chronal_calibration = ChronalCalibration.new
    chronal_calibration.update(frequencies)
    assert_equal 0, chronal_calibration.value
  end

  def test_last_multi_value_update
    frequencies = <<-HEREDOC
      -1
      -2
      -3
    HEREDOC

    chronal_calibration = ChronalCalibration.new
    chronal_calibration.update(frequencies)
    assert_equal -6, chronal_calibration.value
  end

  def test_example_frequency
    skip
    frequencies = <<-HEREDOC
      +1
      -2
      +3
      +1
    HEREDOC

    chronal_calibration = ChronalCalibration.new
    chronal_calibration.update(frequencies)
    assert_equal 2, chronal_calibration.first_frequency
  end

  def test_first_frequency
    skip
    frequencies = <<-HEREDOC
      +1
      -1
    HEREDOC

    chronal_calibration = ChronalCalibration.new
    chronal_calibration.update(frequencies)
    assert_equal 0, chronal_calibration.first_frequency
  end

  def test_first_frequency_bis
    skip
    frequencies = <<-HEREDOC
      +1
      -1
    HEREDOC

    chronal_calibration = ChronalCalibration.new(1)
    chronal_calibration.update(frequencies)
    assert_equal 1, chronal_calibration.first_frequency
  end

  def test_second_frequency
    skip
    frequencies = <<-HEREDOC
      +3
      +3
      +4
      -2
      -4
    HEREDOC

    chronal_calibration = ChronalCalibration.new
    chronal_calibration.update(frequencies)
    assert_equal 10, chronal_calibration.first_frequency
  end

  def test_third_frequency
    skip
    frequencies = <<-HEREDOC
      -6
      +3
      +8
      +5
      -6
    HEREDOC

    chronal_calibration = ChronalCalibration.new
    chronal_calibration.update(frequencies)
    assert_equal 5, chronal_calibration.first_frequency
  end

  def test_last_frequency
    skip
    frequencies = <<-HEREDOC
      +7
      +7
      -2
      -7
      -4
    HEREDOC

    chronal_calibration = ChronalCalibration.new
    chronal_calibration.update(frequencies)
    assert_equal 14, chronal_calibration.first_frequency
  end
end
