require './lib/journey'

class Oystercard

  BALANCE_LIMIT = 90
  FARE = 1

  attr_reader :balance

  def initialize
    @balance = 0
    @journey = Journey.new
  end

  def top_up(amount)
    fail "Error: Balance exceeds #{ BALANCE_LIMIT }" if @balance + amount > BALANCE_LIMIT
    @balance += amount
  end

  def touch_in(station)
    fail "Error: Insufficient funds" if @balance < FARE
    @journey.entry_station << station
  end

  def touch_out(station)
    deduct
    @journey.exit_station << station
    @journey.finish
  end

  private

  attr_writer :journey

  def deduct
    @balance -= FARE
  end

end
