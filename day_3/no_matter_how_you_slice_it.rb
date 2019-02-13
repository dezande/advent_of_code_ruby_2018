class NoMatterHowYouSliceIt
  attr_reader :claims

  def initialize(inputs)
    @claims = inputs.lines.inject({}) do |memo, input|
      memo.merge(
        find_id(input) => {
          left_edge: find_left_edge(input),
          top_edge: find_top_edge(input),
          wide: find_wide(input),
          tall: find_tall(input)
        }
      )
    end
  end

  def square_inches
    square
      .flatten
      .select { |cell| cell > 1 }
      .count
  end

  def claim_don_t_overlap
    claims.each do |id, claim|
      return id unless in_the_square?(claim)
    end
  end

  private

  def square
    claims
      .each_with_object(Array.new(1000) { Array.new(1000, 0) }) do |claim, memo|
        claim.last[:wide].times do |x|
          claim.last[:tall].times do |y|
            memo[x + claim.last[:left_edge]][y + claim.last[:top_edge]] += 1
          end
        end
      end
  end

  def in_the_square?(wide:, tall:, left_edge:, top_edge:)
    square[left_edge][top_edge] > 1 ||
      square[left_edge][tall + top_edge - 1] > 1 ||
      square[wide + left_edge - 1][top_edge] > 1 ||
      square[wide + left_edge - 1][tall + top_edge - 1] > 1
  end

  def find_id(input)
    input.scan(/#\d+/).first[1..-1].to_i
  end

  def find_left_edge(input)
    input.scan(/\d+,/).first[0...-1].to_i
  end

  def find_top_edge(input)
    input.scan(/,\d+/).first[1..-1].to_i
  end

  def find_wide(input)
    input.scan(/\d+x/).first[0...-1].to_i
  end

  def find_tall(input)
    input.scan(/x\d+/).first[1..-1].to_i
  end
end
