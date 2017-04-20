require 'oystercard'

describe Oystercard do
  subject { Oystercard.new }
  alias_method :oystercard, :subject
  let(:balance_limit) { Oystercard::BALANCE_LIMIT }
  let(:fare) { Oystercard::FARE }
  let(:station) { double :station }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  let(:journey) { { entry_station => exit_station } }

  it 'default balance of 0' do
    expect(oystercard.balance).to eq 0
  end

  # describe '#touch_out' do
  #   it 'deducts fare when card touches out' do
  #     expect { oystercard.touch_out(station) }.to change { oystercard.balance }.by(-fare)
  #   end
  # end

  describe '#top_up' do
    it 'tops up a card' do
      expect { oystercard.top_up(1) }.to change { oystercard.balance }.by 1
    end
    it 'raises exception when balance_limit exceeds limit' do
      expect { oystercard.top_up(balance_limit + 1) }.to raise_error "Error: Balance exceeds #{balance_limit}"
    end
  end

  context 'it does not require a #top_up to @balance' do

    describe '#touch_in' do
      it 'throws and error if balance <= 0 at touch in' do
        expect { oystercard.touch_in(station) }.to raise_error "Error: Insufficient funds"
      end
    end
  end

end
