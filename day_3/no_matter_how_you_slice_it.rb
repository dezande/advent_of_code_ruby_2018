class NoMatterHowYouSliceIt
  attr_reader :claims

  def initialize(inputs)
    @claims = inputs.lines.map do |input|
      {
        id: id(input),
        left_edge: left_edge(input),
        top_edge: top_edge(input),
        wide: wide(input),
        tall: tall(input)
      }
    end
  end

  def square_inches
    claims
      .each_with_object(Array.new(1000) { Array.new(1000, 0) }) do |claim, memo|
        claim[:wide].times do |x|
          claim[:tall].times do |y|
            memo[x + claim[:left_edge]][y + claim[:top_edge]] += 1
          end
        end
      end
      .flatten
      .select { |cell| cell > 1 }
      .count
  end

  private

  def id(input)
    input.scan(/#\d+/).first[1..-1].to_i
  end

  def left_edge(input)
    input.scan(/\d+,/).first[0...-1].to_i
  end

  def top_edge(input)
    input.scan(/,\d+/).first[1..-1].to_i
  end

  def wide(input)
    input.scan(/\d+x/).first[0...-1].to_i
  end

  def tall(input)
    input.scan(/x\d+/).first[1..-1].to_i
  end
end
