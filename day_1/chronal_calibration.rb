class ChronalCalibration
  attr_reader :value

  def initialize(value = 0)
    @value = value
  end

  def update(frequencies)
    @value += frequencies.lines.map(&:to_i).sum
  end
end
