require_relative 'bike'

class DockingStation
  attr_reader :bike_array


   def initialize
   	@bike_array = []
   end

  def release_bike
    fail 'No bikes available' if @bike_array.empty?
    @bike_array.pop
  end

  # Original code which passed original test
  # def release_bike
  #   if @bike
  #      fail "Bike already exists"
  #    else
  #      @bike = Bike.new
  #  end
  # end

  def dock(bike)
    fail 'Docking station full' if @bike_array.count >= 20
     @bike_array <<  bike
  end

  #Our code which passed
  # def dock(docked_bike)
  #   if @bike
  #     fail "Dock already full"
  #   else
  #     @bike = docked_bike
  #   end
  # end

end
