require 'docking_station'
require 'bike'

describe DockingStation do

 let(:bike) { double(:bike, report_broken: false, broken?: false, fix: true) }
 let(:broken_bike) { double(:broken_bike, report_broken: true, broken?: true, fix: false) }

  describe 'initialization' do
    it 'sets capacity of dock of 20 when no argument is passed' do
      expect(subject.capacity).to eq 20
    end

    it 'sets capacity to argument passed' do
      station = DockingStation.new(40)
      expect(station.capacity).to eq 40
    end

  end

  describe '#release_bike' do
    it 'responds to release_bike' do
      expect(subject).to respond_to :release_bike
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
      bikes = subject.bikes
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'raises an error when bike is broken' do
       subject.dock(broken_bike)
       expect {subject.release_bike }.to raise_error 'No working bikes available'
    end
  end

  describe '#dock' do
    it 'contains bike' do
       subject.dock(broken_bike)
       expect(subject.bikes).to include broken_bike
   end
    it 'expects a bike to be docked' do
      bikes = subject.bikes
      expect(subject.dock(bike)).to eq (bikes << bike)
    end

    it 'raises an error when full' do
      subject.capacity.times {subject.dock(bike)}
      expect { subject.dock bike }.to raise_error 'Dock already full'
    end
  end

end
