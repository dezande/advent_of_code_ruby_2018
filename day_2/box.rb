class Box
  def initialize(id)
    @contains = id.chars.inject({}) do |memo, value|
      value = value.to_sym
      memo[value] ||= 0
      memo.merge(value => memo[value] + 1)
    end
  end

  def includes_2_letters_identical?
    contains.value?(2)
  end

  def includes_3_letters_identical?
    contains.value?(3)
  end

  private

  attr_reader :contains
end
