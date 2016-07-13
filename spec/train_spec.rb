require 'spec_helper'

describe Train do

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
