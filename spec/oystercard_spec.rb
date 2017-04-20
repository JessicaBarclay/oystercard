require 'oystercard'

describe Oystercard do
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

  context 'balance set to maximum and touch in' do
    before { oystercard.top_up(balance_limit) }
    before { oystercard.touch_in(station) }

    describe '#touch_out' do
      it 'deducts fare when card touches out' do
        expect { oystercard.touch_out(station) }.to change { oystercard.balance }.by(-fare)
      end
      # it 'records @journey' do
      #  expect(oystercard.touch_out(station)).to eq journey
      # end
    end
  end

  describe '#top_up' do
    it 'tops up a card' do
      expect { oystercard.top_up(balance_limit) }.to change { oystercard.balance }.by balance_limit
    end

    it 'raises exception when balance_limit exceeds limit' do
      expect { oystercard.top_up(balance_limit + 1) }.to raise_error "Error: Balance exceeds #{ balance_limit }"
    end
  end

  context '@balance = 0' do
    describe '#touch_in' do
      it 'throws and error if balance <= 0 at touch in' do
        expect { oystercard.touch_in(station) }.to raise_error "Error: Insufficient funds"
      end
    end
  end

end
