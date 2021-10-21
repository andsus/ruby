class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  class UnsupportedOperation < StandardError; end

  def self.calculate(first_operand, second_operand, operation)
    non_operation(operation)
    # raise ArgumentError unless first_operand.is_a?(Numeric)
    # raise ArgumentError unless second_operand.is_a?(Numeric)
    validate_argument(first_operand, second_operand)

    begin
      "#{first_operand} #{operation} #{second_operand} = #{result(first_operand, second_operand, operation)}"
    rescue ZeroDivisionError
      'Division by zero is not allowed.'
    end
  end

  private_class_method

  def self.non_operation(operation)
    raise UnsupportedOperation unless ALLOWED_OPERATIONS.include?(operation)
  end

  def self.validate_argument(first_operand, second_operand)
    return if first_operand.is_a?(Numeric) && second_operand.is_a?(Numeric)
    raise ArgumentError
  end

  def self.result(first_operand, second_operand, operation)
    case operation
    when '+'
      first_operand + second_operand
    when '/'
      first_operand / second_operand
    when '*'
      first_operand * second_operand
    end
  end
end
