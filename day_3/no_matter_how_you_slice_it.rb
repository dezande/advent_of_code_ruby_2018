require 'set'

class NoMatterHowYouSliceIt
  attr_reader :claims, :candidates, :square

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
    @candidates = Set.new(claims.keys)
    @square = initialize_square
  end

  def square_inches
    square
      .flatten
      .select { |cell| cell.count > 1 }
      .count
  end

  def claim_don_t_overlap
    candidates.to_a.first
  end

  private

  def initialize_square
    claims
      .each_with_object(Array.new(1000) { Array.new(1000) { Set.new } }) do |claim, memo|
        claim.last[:wide].times do |x|
          claim.last[:tall].times do |y|
            memo[x + claim.last[:left_edge]][y + claim.last[:top_edge]].add claim.first

            if memo[x + claim.last[:left_edge]][y + claim.last[:top_edge]].count > 1 
              @candidates -= memo[x + claim.last[:left_edge]][y + claim.last[:top_edge]]
            end
          end
        end
      end
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
