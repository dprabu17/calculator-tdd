class StringCalculator
  def self.add(params_str)
    return 0 if params_str.empty?

    delimiters, params_str = custom_delimiter(params_str)

    given_inputs = params_str.split(delimiters).map(&:to_i)
    negatives = given_inputs.select { |n| n < 0 }
    raise "negative numbers not allowed #{negatives.join(', ')}" if negatives.any?

    result = given_inputs.sum
    return result
  end

  def self.custom_delimiter(input_string)
    delimiters = /,|\n/
    if input_string.start_with?("//")
      delimiter, input_string = input_string[2..].split("\n", 2)
      delimiters = /#{delimiter}/
    end
    return [delimiters, input_string]
  end
end