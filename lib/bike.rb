class Bike
  attr_accessor :broken

  def initialize(broken = false)
    @broken = broken
  end

  def working?
    if @broken == true
      false
    else
      true
    end
  end
end
