require 'bike'
describe Bike do

  it { is_expected.to respond_to :broken? }

    it 'can be reported as broken' do
      subject.report_broken
      expect(subject.broken?).to eq true
    end
end

=begin
  it { is_expected.to respond_to :working? }

   describe 'initialization' do

     it 'sets broken to false when no argument is passed' do
       bike = Bike.new
       expect(bike.broken).to eq false
     end

     it 'sets broken to argument passed' do
       bike = Bike.new(true)
       expect(bike.broken).to eq true
     end

     it 'expects working? to be false is bike is broken' do
       bike= Bike.new
       bike.broken = true
       expect(bike.working?).to eq false
     end

   end

  end
=end
