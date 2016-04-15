require 'garage'
require 'bike'

describe Garage do

 let(:bike){ double :bike, broken?: false, fix: true }
 let(:broken_bike){ double :bike, broken?: true}

  it 'expects a bike to be docked' do
    expect(Garage.new.dock(broken_bike)).to eq [broken_bike]
  end

  describe 'initialization' do
    it 'sets capacity of garage dock of 20 when no argument is passed' do
      garage = Garage.new
      expect(garage.capacity).to eq 20
    end

    it 'sets capacity to argument passed' do
      garage = Garage.new(40)
      expect(garage.capacity).to eq 40
    end

  end

  describe '#release_bike' do
    it 'responds to release_bike' do
      expect(Garage.new).to respond_to :release_bike
    end

    it 'releases a bike' do
      bike_array = subject.bike_array
      bike_array << bike
      expect(subject.release_bike).to eq bike
    end

    it 'releases a working bike' do
       bike_array = subject.bike_array
      bike_array << bike
       expect(subject.release_bike).not_to be_broken
    end

    it 'raises an error when there are no bikes available' do
      # Let's not dock a bike first:
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'raises an error when try to release broken bike' do
       subject.dock(broken_bike)
       expect {subject.release_bike }.to raise_error 'This bike is broken, please try again'
    end
  end

  describe '#dock' do
    it 'raises an error when full' do
      subject.capacity.times {subject.dock(broken_bike)}
      expect { subject.dock(broken_bike) }.to raise_error 'Docking station full'
    end

    it 'raises an error when try to dock a working bike' do
       expect {subject.dock(bike)}.to raise_error 'This bike is working, it should not be docked in the garage'
    end
  end

  #describe '#fix' do
    #it 'fixes a bike' do
       #expect (subject.fix_bike(broken_bike)).to be_working
    #end
  #end

end