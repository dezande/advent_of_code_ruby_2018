require 'minitest/autorun'
require 'minitest/pride'

# Test for Chronal Calibration
class ChronalCalibrationTest < Minitest::Test
  def a_default_value?
    assert_equal 0, ChronalCalibration.new.value
  end

  def a_value_imposed?
    skip
    assert_equal 5, ChronalCalibration.new(5).value
  end

  def first_single_value_update
    skip
    chronal_calibration = ChronalCalibration.new(0)
    chronal_calibration.update('+1')
    assert_equal 1, chronal_calibration.value
  end

  def second_single_value_update
    skip
    chronal_calibration = ChronalCalibration.new(1)
    chronal_calibration.update('-2')
    assert_equal 1, chronal_calibration.value
  end

  def third_single_value_update
    skip
    chronal_calibration = ChronalCalibration.new(-1)
    chronal_calibration.update('+3')
    assert_equal 2, chronal_calibration.value
  end

  def last_single_value_update
    skip
    chronal_calibration = ChronalCalibration.new(2)
    chronal_calibration.update('+1')
    assert_equal 3, chronal_calibration.value
  end

  def first_multi_value_update
    skip
    chronal_calibration = ChronalCalibration.new
    chronal_calibration.update('+1, +1, +1')
    assert_equal 3, chronal_calibration.value
  end

  def second_multi_value_update
    skip
    chronal_calibration = ChronalCalibration.new
    chronal_calibration.update('+1, +1, -2')
    assert_equal 0, chronal_calibration.value
  end

  def last_multi_value_update
    skip
    chronal_calibration = ChronalCalibration.new
    chronal_calibration.update('-1, -2, -3')
    assert_equal -6, chronal_calibration.value
  end
end
