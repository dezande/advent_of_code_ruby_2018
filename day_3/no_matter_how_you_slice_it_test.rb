require 'minitest/autorun'
require 'minitest/pride'
require_relative 'no_matter_how_you_slice_it'

# Test NoMatterHowYouSliceIt
class NoMatterHowYouSliceItTest < Minitest::Test
  def test_read_a_claim
    claims = '#123 @ 3,2: 5x4'
    result = NoMatterHowYouSliceIt.new(claims)
    assert_equal(
      result.claims,
      123 => {
        left_edge: 3,
        top_edge: 2,
        wide: 5,
        tall: 4
      }
    )
  end

  def test_read_a_other_claim
    claims = '#1 @ 50,30: 64x23'
    result = NoMatterHowYouSliceIt.new(claims)
    assert_equal(
      result.claims,
      1 => {
        left_edge: 50,
        top_edge: 30,
        wide: 64,
        tall: 23
      }
    )
  end

  def test_square_inches
    claims = <<-HERODOC
      #1 @ 1,3: 4x4
      #2 @ 3,1: 4x4
      #3 @ 5,5: 2x2
    HERODOC

    result = NoMatterHowYouSliceIt.new(claims).square_inches
    assert_equal result, 4
  end

  def test_find_claims_id
    claims = <<-HERODOC
      #1 @ 1,3: 4x4
      #2 @ 3,1: 4x4
      #3 @ 5,5: 2x2
    HERODOC

    result = NoMatterHowYouSliceIt.new(claims).claim_don_t_overlap
    assert_equal result, 3
  end
end
