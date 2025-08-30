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

    it "handle new lines between numbers" do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it "supports custom delimiters" do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end

    it "returns negative number exception" do
      expect(StringCalculator.add("-1,5")).to eq("negative numbers not allowed -1")
    end

    it "returns multiple negative numbers exception" do
      expect(StringCalculator.add("//;\n-1;2")).to eq("negative numbers not allowed -1")
    end

    it 'ignore numbers bigger than 1000' do
      expect(StringCalculator.add('2,1001')).to eq(2)
    end
  end
end