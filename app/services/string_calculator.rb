class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?
    return numbers.to_i unless numbers.include?(',')

    nums = numbers.split(",").map(&:to_i)
    nums.sum
  end
end