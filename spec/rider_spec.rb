require 'spec_helper'

describe Rider do

  describe '#name' do
    it "returns the name of the rider" do
      test_rider = Rider.new({:name => 'Joe'})
      expect(test_rider.name()).to(eq('Joe'))
    end
  end

  describe '.all' do
    it "returns all records from rider table" do
      expect(Rider.all()).to(eq([]))
    end
  end

end
