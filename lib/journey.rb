class Journey

  PENALTY_FARE = 6
  FARE = 1

  attr_reader :entry_station, :exit_station, :journeys

  def initialize(entry_station = PENALTY_FARE)
    @entry_station =[]
    @exit_station = []
    @journeys = {}
  end

  def finish
    @journeys = Hash[ @entry_station.zip(@exit_station) ]
  end

  def fare(amount = PENALTY_FARE)
    amount
  end

  private

  attr_writer :journeys

end
