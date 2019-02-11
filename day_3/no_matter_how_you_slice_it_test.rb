require 'minitest/autorun'
require 'minitest/pride'
require_relative 'no_matter_how_you_slice_it'

# Test NoMatterHowYouSliceIt
class NoMatterHowYouSliceItTest < Minitest::Test
  def test_read_a_claim
    claims = ['#123 @ 3,2: 5x4']
    result = NoMatterHowYouSliceIt.new(claims),
    assert_equal(
      result.claims,
      id: '123',
      left_edge: 3,
      top_edge: 2,
      wides: 5,
      tall: 4
    )
  end
end
