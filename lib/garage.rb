require_relative 'bike'

class Garage
  DEFAULT_CAPACITY = 20

  attr_reader :bike_array
  attr_reader :capacity


   def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bike_array = []
   end

  def release_bike
    fail 'No bikes available' if self.empty?
    bike_to_release = @bike_array.pop
    if bike_to_release.broken? == true
      fail 'This bike is broken, please try again'
    else
      return bike_to_release
    end
  end

  def dock(bike)
    fail 'Docking station full' if self.full?
    if bike.broken? == false
      fail 'This bike is working, it should not be docked in the garage'
    else
      return @bike_array <<  bike
    end
  end

#private

  def empty?
    if @bike_array.empty?
      true
     else
      false
     end
  end

  def full?
    if @bike_array.count >= @capacity
      true
    else
      false
    end
  end
end