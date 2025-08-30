class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?
    delimiter = /,|\n/
    if numbers.start_with?("//")
      parts = numbers.split("\n")
      delimiter = Regexp.escape(parts[0][2..])
      numbers = parts[1]
    end

    nums = numbers.split(/#{delimiter}/).map(&:to_i)
    message = check_for_negatives(nums)
    return message if message.present?

    nums = check_for_valid_numbers(nums)
    nums.sum
  end

  private

  def self.check_for_negatives(nums)
    negatives = nums.select { |n| n < 0 }
    return "negative numbers not allowed #{negatives.join(',')}" if negatives.any?
  end

  def self.check_for_valid_numbers(nums)
    nums.select { |n| n <= 1000 }
  end
end