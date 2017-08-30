# encoding: UTF-8
module Ease64
  module_function

  def encode64(bin)
    octals_blob = bin.bytes.map { |byte| byte.to_s(8).rjust(3, '0') }.join

    # TODO: Optimize! if octals_blob.length % ?? ...
    two_digit_octals = octals_blob.scan(/..?/).map { |octa|
      octa.ljust(2, '0')
    }

    result = two_digit_octals.map do |oo|
      num = oo.oct
      (num < 63) ? (num + 64).chr : num.chr
    end

    result.join.force_encoding('UTF-8')
  end

  def decode64(str)
    octals_blob = str.chars.map { |c|
      octal = c.ord.to_s(8)
      octal.slice(-2..-1)
    }.join

    three_digit_octals = octals_blob.scan(/..?.?/)
    three_digit_octals.pop if three_digit_octals.last ==  '0'

    result = three_digit_octals.map { |ooo| ooo.oct.chr }

    result.join.force_encoding('UTF-8')
  end
end
