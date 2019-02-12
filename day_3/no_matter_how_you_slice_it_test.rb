require 'minitest/autorun'
require 'minitest/pride'
require_relative 'no_matter_how_you_slice_it'

# Test NoMatterHowYouSliceIt
class NoMatterHowYouSliceItTest < Minitest::Test
  def test_read_a_claim
    claims = ['#123 @ 3,2: 5x4']
    result = NoMatterHowYouSliceIt.new(claims)
    assert_equal(
      result.claims.first,
      id: 123,
      left_edge: 3,
      top_edge: 2,
      wide: 5,
      tall: 4
    )
  end

  def test_read_a_other_claim
    claims = ['#1 @ 50,30: 64x23']
    result = NoMatterHowYouSliceIt.new(claims)
    assert_equal(
      result.claims.first,
      id: 1,
      left_edge: 50,
      top_edge: 30,
      wide: 64,
      tall: 23
    )
  end
end
