class Oyster

  attr_accessor :in_journey, :start_location

  def initialize(upper_limit = 20)
    @balance = 0
    @upper_limit = upper_limit
    @in_journey = false
    @start_location = ''
    @history = Array.new
  end

  def check_balance
    @balance
  end

  def add_credit(amount)
    raise('Balance limited exceeded') unless (amount + @balance) <= @upper_limit

    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def journey_start(station)
    @start_location = station
  end

  def journey_end(station)
    @history << [@start_location, station]
    @start_location = ''
  end


  def journey_history
    @history
  end
end
