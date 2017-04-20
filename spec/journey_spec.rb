require 'journey'
require 'oystercard'

describe Journey do
  let(:balance_limit) { Oystercard::BALANCE_LIMIT }
  let(:fare) { Oystercard::FARE }
  let(:oystercard) { double :oystercard }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  let(:journey) { { entry_station => exit_station } }

  it "creates a new instance" do
    expect(subject).to eq subject
  end
  it "has an empty list of journeys by default" do
    expect(subject.journeys).to be_empty
  end
  # it "returns journey list" do
  #   expect(subject.finish).to include journey
  # end

  # context 'complete journey' do
  #   before { oystercard.top_up(balance_limit) }
  #   before { oystercard.touch_in(station) }
  #   before { oystercard.touch_out(station) }
  #
  #   it 'appends journey to @journeys at #touch_out' do
  #    expect(oystercard.journeys).to include journey
  #   end
  # end
  #
  # describe '@journeys' do
  #   it 'journey is created after touching in/out' do
  #     oystercard.top_up(90)
  #     oystercard.touch_in(station)
  #     oystercard.touch_out(station)
  #     expect(oystercard.journeys).not_to be_empty
  #   end
  # end

  # describe "#journey" do
  #     it 'stores a journey' do
  #     oystercard.touch_out(exit_station)
  #     expect(oystercard.journeys).to include journey
  #   end
  #   it 'stores the entry station' do
  #     expect(oystercard.entry_station).to eq [entry_station]
  #   end
  # end


#   describe '#touch_in' do
#     it 'appends entry_station to @entry_station array' do
#       expect(oystercard.entry_station).to eq [entry_station]
#     end
#     it 'appends exit_station to @exit_station array' do
#       expect(oystercard.exit_station).to eq [exit_station]
#     end
#   end
# end

end
