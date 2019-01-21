class InventoryManagementSystem
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
  end

  def initialize(input = nil)
    @input = input
  end

  def checksum
    @input.lines.count { |line| two_letter?(line.strip) } *
      @input.lines.count { |line| three_letter?(line.strip) }
  end

  def two_letter?(input)
    input.chars.any? { |char| input.count(char) == 2 }
  end

  def three_letter?(input)
    input.chars.any? { |char| input.count(char) == 3 }
  end
end
