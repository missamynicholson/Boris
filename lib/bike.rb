class Bike

  def report_broken
    @broken = true
  end

  def broken?
    @broken
  end

  def fix
    @broken = false
  end

end

=begin
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
=end
