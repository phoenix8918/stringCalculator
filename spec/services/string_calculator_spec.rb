require 'rails_helper'

RSpec.describe StringCalculator do
  describe ".add" do
    it "returns 0 for an empty string" do
      expect(StringCalculator.add("")).to eq(0)
    end

    it "returns the number itself if only one number" do
      expect(StringCalculator.add("1")).to eq(1)
    end

    it "returns sum of two numbers" do
      expect(StringCalculator.add("1,5")).to eq(6)
    end

    it "returns sum of multiple numbers" do
      expect(StringCalculator.add("1,2,3,4")).to eq(10)
    end
  end
end