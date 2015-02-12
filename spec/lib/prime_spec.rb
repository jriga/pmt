require 'spec_helper'
require 'prime'

describe Prime do
  before do
    Fixnum.include(Prime)
  end
  describe "class methods" do
    it "::generate returns a lazy eunm of prime numbers" do
      expect(described_class.generate).to be_kind_of(Enumerator::Lazy)
    end
  end

  describe "instance methods" do

    [2,3,5,7,11,13].each do |tested_value|
      it "#{tested_value} is a prime number" do
        expect(tested_value.prime?).to eq(true)
      end
    end
    
    [1,4,9,15].each do |tested_value|
      it "#{tested_value} is not a prime number" do
        expect(tested_value.prime?).to eq(false)
      end
    end

  end

end

