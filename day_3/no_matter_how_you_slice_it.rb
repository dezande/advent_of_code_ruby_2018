class NoMatterHowYouSliceIt
  attr_reader :claims

  def initialize(inputs)
    @claims = inputs.map do |input|
      {
        id: id(input),
        left_edge: left_edge(input),
        top_edge: top_edge(input),
        wide: wide(input),
        tall: tall(input)
      }
    end
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
