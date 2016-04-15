require 'docking_station'

require 'bike'

describe DockingStation do

 let(:bike){ double :bike }

  it 'expects a bike to be docked' do
    bike_array = subject.bike_array
    expect(DockingStation.new.dock(bike)).to eq (bike_array << bike)
  end

  describe 'initialization' do
    it 'sets capacity of dock of 20 when no argument is passed' do
      station = DockingStation.new
      expect(station.capacity).to eq 20
    end

    it 'sets capacity to argument passed' do
      station = DockingStation.new(40)
      expect(station.capacity).to eq 40
    end

  end

  describe '#release_bike' do
    it 'responds to release_bike' do
      expect(DockingStation.new).to respond_to :release_bike
    end

    it 'releases a bike' do
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'releases a working bike' do
       subject.dock(bike)
       expect(subject.release_bike).not_to be_broken
    end

    it 'raises an error when there are no bikes available' do
      # Let's not dock a bike first:
      bike_array = subject.bike_array
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'raises an error when bike is broken' do
       subject.dock(bike)
       bike.report_broken
       expect {subject.release_bike }.to raise_error 'This bike is broken, please try again'
    end
  end

  describe '#dock' do
    it 'raises an error when full' do
      subject.capacity.times {subject.dock(bike)}
      expect { subject.dock bike }.to raise_error 'Docking station full'
    end
  end

end

=begin


it 'responds to the method report' do
     expect(DockingStation.new).to respond_to :report
end

describe '#report' do
  it 'report bike and add to broken bike array' do
    bike = Bike.new
    subject.report(bike)
    expect(bike.working?).to eq false
  end
end

it 'releases a working bike' do
  bike = Bike.new
  subject.dock(bike)
  expect(subject.release_bike).to be_working
 end

  # it 'respond to bike' do
#  expect(DockingStation.new).to respond_to :bike
# end

# it 'contains bike' do
#   bike = Bike.new
#   station = DockingStation.new
#   station.dock(bike)
#   expect(station.bike).to eq bike
#  end

# Removing the respond_to rspec tests
#  it 'expects a bike to be working' do
#    expect(DockingStation.new.release_bike.working?).to eq true
#  end

#  it 'expects bike to be reported as broken' do
#    DockingStation.report
#    DockingStation.dock(bike)
#    expect(Bike.new).not_to be_working
#  end


# Removing the respond_to rspec tests to clean-up (syntactic sugar)
# it 'responds to docking' do
#   expect(DockingStation.new).to respond_to 'dock'
# end

# it { is_expected.to respond_to(:dock).with(1).argument }

  # Our original test which passed
  # it 'returns error if dockingstation has already given out the bike' do
  #   station = DockingStation.new
  #   station.release_bike
  #   expect{station.release_bike}.to raise_error 'Bike already exists'
  #end


  # Our original test passed - not as legible as Makers'
  # it 'returns error if docking station already has a bike' do
  #   station = DockingStation.new
  #   bike = Bike.new
  #   bike2 = Bike.new
  #   station.dock(bike)
  #   expect{station.dock(bike2)}.to raise_error 'Dock already full'
  # end


=end




