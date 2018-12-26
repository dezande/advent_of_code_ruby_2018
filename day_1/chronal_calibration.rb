require 'set'

class ChronalCalibration
  attr_reader :value

  def initialize(value = 0)
    @value = value
  end

  def update(frequencies)
    @frequencies = frequencies.lines.map(&:to_i)
    @intermediate_value = @frequencies.inject(Set[value]) do |memo, frequency|
      @value += frequency
      memo << value
    end
  end

  def first_frequency
    find_first_frequency(value)
  end

  private

  def find_first_frequency(current_value)
    @frequencies.each do |frequency|
      current_value += frequency
      return current_value if @intermediate_value.include?(current_value)
    end

    find_first_frequency(current_value)
  end
end
