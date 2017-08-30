require 'minitest/autorun'
require 'minitest/pride' # Optional, can be commented out.
require_relative 'ease64'

class Ease63Test < Minitest::Test
  # ### ENCODE TESTS
  def test_encode_one_char
    # skip
    enc = Ease64.encode64('A')
    assert_equal 'HH', enc
  end

  def test_encode_word
    # skip
    enc = Ease64.encode64('Hello')
    assert_equal 'IAeMalMx', enc
  end

  # ### DECODE TESTS
  def test_decode_one_char
    # skip
    plain = Ease64.decode64('HH')
    assert_equal 'A', plain
  end

  def test_decode_word
    # skip
    plain = Ease64.decode64('IAeMalMx')
    assert_equal 'Hello', plain
  end

  # ### ENCODE + DECODE TESTS

  def test_handle_one_null_char
    # skip
    plain = "\x00"
    enc = Ease64.encode64(plain)
    assert_equal plain, Ease64.decode64(enc)
  end

  def test_handle_null_chars
    # skip
    null_char = "\x00"
    6.times do |n|
      plain = null_char * (n + 1)
      enc = Ease64.encode64(plain)
      assert_equal plain, Ease64.decode64(enc)
    end
  end

  def test_handle_visible_ascii_chars
    # skip
    ascii_string = [*' '..'~'].shuffle.join
    enc = Ease64.encode64(ascii_string)
    assert_equal ascii_string, Ease64.decode64(enc)
  end
end
