module Ease64
  module_function

  def encode64(bin)
    result = ''

    octals_blob = bin.bytes.map { |byte| byte.to_s(8) }.join

    # TODO: Optimize! if octals_blob.length % ?? ...
    two_digits_octals = octals_blob.scan(/..?/).map { |octa|
      octa.ljust(2, '0')
    }

    result = two_digits_octals.map do |oo|
      num = oo.oct
      (num < 63) ? (num + 64).chr : num.chr
    end

    result.join
  end

  def decode64(str)
    octals_blob = str.chars.map { |c|
      octal = c.ord.to_s(8)
      octal.slice(-2..-1)
    }.join

    three_digit_octals = octals_blob.scan(/..?./)

    result = three_digit_octals.map { |ooo| ooo.oct.chr }

    result.join
  end
end
