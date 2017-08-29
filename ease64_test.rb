require 'minitest/autorun'
require 'minitest/pride' # Optional, can be commented out.
require_relative 'ease64'

class Ease63Test < Minitest::Test
  def test_encode_one_char
    # skip
    enc = Ease64.encode64('A')
    assert_equal 'HH', enc
  end

  def test_decode_one_char
    # skip
    plain = Ease64.decode64('HH')
    assert_equal 'A', plain
  end
end
