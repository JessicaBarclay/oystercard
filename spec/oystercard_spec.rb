require 'oystercard'

describe Oystercard do
  subject { Oystercard.new }
  alias_method :oystercard, :subject
  let(:balance) { Oystercard::BALANCE }
  let(:fare) { Oystercard::FARE }
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }
  let(:journey) { { entry_station => exit_station } }

  it 'creates journey at touch out' do
   oystercard.top_up(balance)
   oystercard.touch_in(entry_station)
   oystercard.touch_out(exit_station)
   expect(oystercard.journeys).to include journey
  end
  it 'default balance of 0' do
    expect(oystercard.balance).to be_an_instance_of(Integer)
  end
  it 'checks if a card has an empty list of journeys by default' do
    expect(oystercard.journeys).to be_empty
  end

  context 'sets balance to maximum and touches in' do
    before { oystercard.top_up(balance) }
    before { oystercard.touch_in(entry_station) }

    describe '#touch_in' do
      it 'adds an entry station' do
        expect(oystercard.entry_station).to eq [entry_station]
      end
    end

    describe '#in_journey?' do
      it 'expects touched in card to be in_journey' do
        expect(oystercard).to be_in_journey
      end
      it 'expects touched out card to be out of journey' do
        oystercard.touch_out(exit_station)
        expect(oystercard.exit_station).to eq [exit_station]
      end
    end

    describe '#touch_out' do
      it 'deducts fare when card touches out' do
        expect { oystercard.touch_out(exit_station) }.to change { oystercard.balance }.by(-fare)
      end
    end

  end

  context 'it does not require a top_up' do

    describe '#touch_in' do
      it 'throws and error if balance is bellow minimum at touch in' do
        expect { oystercard.touch_in(exit_station) }.to raise_error "Error: Insufficient funds"
      end
    end

    describe '#top_up' do
      it 'tops up a card' do
        expect { oystercard.top_up(1)}.to change { oystercard.balance }.by 1
      end
      it 'raises exception when balance exceeds limit' do
        expect { oystercard.top_up(balance + 1) }.to raise_error "Error: balance exceeds #{balance}"
      end
    end

 end

end
