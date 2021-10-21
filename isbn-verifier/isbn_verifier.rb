class IsbnVerifier
  def self.valid?(isbn_input)
    isbn = isbn_input.reverse.scan(/^[0-9X]|[0-9]/)
    return false unless isbn.length == 10

    sum = 0

    isbn.each_with_index { |digit, index| sum += (convert_digit(digit, index) * (index + 1)) }
    (sum % 11).zero?
  end

  private_class_method

  def self.convert_digit(digit, index)
    return 10 if digit == 'X' && index.zero?

    digit.to_i
  end
end
