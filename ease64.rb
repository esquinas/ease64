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
      (num < 63 ) ? (num + 64).chr : num.chr
    end

    result.join
  end

  def decode64(str)
    'A' # TODO
  end
end
