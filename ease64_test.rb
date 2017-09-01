require 'minitest/autorun'
require 'minitest/pride' # Optional.
require_relative 'ease64'

class Ease63Test < Minitest::Test
  # ENCODE TESTS
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

  # DECODE TESTS
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

  def test_decode_anything
    # skip
    plain = Ease64.decode64('anything')
    assert_equal "\r\xB9\xA5)t\a", plain
  end

  # ENCODE + DECODE TESTS

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

  def test_handle_accents
    # skip
    plain = 'áéíóúâêîôûäëïöüâàèìòùñ¡'
    enc = Ease64.encode64(plain)
    assert_equal plain.encoding, Ease64.decode64(enc).encoding
    assert_equal plain, Ease64.decode64(enc)
  end

  def test_unicode
    # skip
    plain = "Two robots: 🤖\u{1f916}"
    enc = Ease64.encode64(plain)
    assert_equal Encoding::UTF_8, Ease64.decode64(enc).encoding
    assert_equal plain, Ease64.decode64(enc)
  end

  def test_handle_data
    # skip
    data = ''
    256.times { data.concat rand(256).chr }
    enc = Ease64.encode64(data)
    assert_equal data.force_encoding('UTF-8'), Ease64.decode64(enc)
  end
end
