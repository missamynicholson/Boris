require_relative 'docking_station'

class Van

  DEFAULT_CAPACITY = 20

  attr_reader :dockingstation, :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  #release bike back to docking station
  def release_bike
    fail 'No bikes available' if empty?
    fail 'No working bikes available' if @bikes.last.broken?
    @bikes.pop
  end

  def dock(bike)
    fail 'Dock already full' if self.full?
    @bikes <<  bike
  end

  def fix_bike(bikes)
    @bikes = bikes.each {|bike| bike.fix}
  end

  def station(dockingstation)
    @dockingstation = dockingstation
  end

  def collect_broken_bikes
    @bikes = @dockingstation.sort_broken_bikes
  end

  #private

  def full?
    @bikes.count >= capacity
  end

  def empty?
    @bikes.empty?
  end

end
