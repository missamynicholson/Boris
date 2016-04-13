require_relative 'bike'

class DockingStation
  attr_reader :bike

  def release_bike
    fail 'No bikes available' unless @bike
    @bike
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
    fail 'Docking station full' if @bike
     @bike = bike
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