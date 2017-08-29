require 'minitest/autorun'
require 'minitest/proud'
require_relative 'ease64'

class Ease63Test < Minitest::Test
  def test_encode_one_char
    skip
    enc = Ease64.encode64('A')
    assert_equal 'HH', enc
  end
end
