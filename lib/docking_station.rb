require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :capacity, :bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
   end

   def release_bike
    fail 'No bikes available' if empty?
    fail 'No working bikes available' if @bikes.last.broken?
    @bikes.pop
  end

  def dock(bike)
    fail 'Dock already full' if self.full?
    @bikes <<  bike
  end

  def sort_broken_bikes
    @bike_broken =  @bikes.select {|bike| bike.broken?}
  end

#private

 def full?
  @bikes.count >= capacity
 end

  def empty?
    @bikes.empty?
  end
end
