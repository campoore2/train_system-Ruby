require 'spec_helper'

describe Train do

  describe '#==' do
    it 'compares two lines' do
      test_train = Train.new({:line => 'blue', :city => 'Munich', :arriv => '12:01', :depar => '12:10'})
      test_train2 = Train.new({:line => 'red', :city => 'Rome', :arriv => '1:14', :depar => '1:25'})
      expect(test_train).to(eq(test_train2))
    end
  end

  describe '#all' do
    it 'starts off with no trains' do
      expect(Train.all()).to(eq([]))
    end
  end

  describe '#line' do
    it 'indicates which line the train runs on' do
      test_train = Train.new({:line => 'blue', :city => 'Munich', :arriv => '12:01', :depar => '12:10'})
      expect(test_train.line()).to(eq('blue'))
    end
  end
  describe '#city' do
    it 'indicates which city train line runs to' do
      test_train = Train.new({:line => 'blue', :city => 'Munich', :arriv => '12:01', :depar => '12:10'})
      expect(test_train.city()).to(eq('Munich'))
    end
  end
  describe '#arriv' do
    it 'indicates when the train arrives at this city' do
      test_train = Train.new({:line => 'blue', :city => 'Munich', :arriv => '12:01', :depar => '12:10'})
      expect(test_train.arriv()).to(eq('12:01'))
    end
  end
  describe '#depar' do
    it 'indicates when the train departs this city' do
      test_train = Train.new({:line => 'blue', :city => 'Munich', :arriv => '12:01', :depar => '12:10'})
      expect(test_train.depar()).to(eq('12:10'))
    end
  end
end
