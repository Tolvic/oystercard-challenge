class Station
  attr_reader :zone

  def initialize(zone = 1)
    @min_fare = 5
    @zone = zone
  end

  def touch_in(card)
    raise('Insufficient funds.') unless card.check_balance >= @min_fare
    card.journey_start(self)
    card.in_journey = true
  end

  def touch_out(card)
    card.deduct(@min_fare)
    card.journey_end(self)
    card.in_journey = false
  end
end
