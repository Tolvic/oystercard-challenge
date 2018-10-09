require 'oyster.rb'

describe Oyster do
    let(:station){ double :station, :touch_in => true, :touch_out => true }

  describe '#check_balance' do
    it 'return balance when customer calls check_balance method' do
      expect(subject.check_balance).to eq 0
    end

    it 'add_credit increments balance on the card by amount specified by the customer' do
      subject.add_credit(5)
      expect(subject.check_balance).to eq 5
    end

    it 'prevents balance from exceeding upper limit of £20' do
      expect{ subject.add_credit(30) }.to raise_error('Balance limited exceeded')
    end

    it 'tops up twice exceeding upper_limit and raises and error' do
      subject.add_credit(15)
      expect{ subject.add_credit(10) }.to raise_error('Balance limited exceeded')
    end
  end

  describe '#deduct' do

    it 'allows deduction of fare/penalty from the balance on the card' do
      expect(subject.deduct(5)).to eq(-5)
    end

    #test does not work as expected due to stubbing and output is dependent on the interaction of two classes
    # it 'deducts fare when after completeing a journey' do
    #   subject.add_credit(10)
    #   station.touch_in(subject)
    #   station.touch_out(subject)
    #   expect(subject.check_balance < 10).to eq(true)
    # end
  end






end
