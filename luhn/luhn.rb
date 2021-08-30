class Luhn
  def self.valid?(creditcard)
    new(creditcard).valid?
  end

  def initialize(creditcard)
    @creditcard = creditcard.delete(' ')
  end

  def valid?
    return unless valid_format?

    (luhn_sum % 10).zero?
  end

  private

  attr_reader :creditcard

  def valid_format?
    creditcard.size > 1 && creditcard !~ (/\D/)
  end

  def luhn_sum
    creditcard.to_i.digits.each_slice(2).sum do |first, second|
      first + digit_sum_of_doubled(second.to_i)
    end
  end

  def digit_sum_of_doubled(number)
    (number * 2).digits.sum
  end
end
