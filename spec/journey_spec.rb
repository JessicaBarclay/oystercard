require 'journey'

describe Journey do
  alias_method :journey, :subject

  it 'has a penalty fare by default' do
    expect(journey.fare).to eq Journey::PENALTY_FARE
  end

  it "creates a new instance" do
    expect(journey).to eq subject
  end
  it "has an empty list @journeys by default" do
    expect(journey.journeys).to be_empty
  end

end
