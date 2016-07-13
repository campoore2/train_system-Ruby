require 'spec_helper'

describe Train do
  describe '.all' do
    it'starts off with no trains' do
      expect(Train.all()).to(eq([]))
    end
  end

  describe '#==' do
    it'compares two lines' do
      test_train = Train.new({:line => 'blue', :city => 'Munich', :arriv => '12:01', :depar => '12:10'})
      test_train2 = Train.new({:line => 'blue', :city => 'Munich', :arriv => '12:01', :depar => '12:10'})
      expect(test_train).to(eq(test_train2))
    end
  end

  describe '#save' do
    it'saves a new train to the train table' do
      train1 = Train.new({:line => 'blue', :city => 'Munich', :arriv => '12:26:30', :depar => '01:26:30'})
      train1.save
      expect(Train.all()).to(eq([train1]))
    end
  end

  describe '#line' do
    it'indicates which line the train runs on' do
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
