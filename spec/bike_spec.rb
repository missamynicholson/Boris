require 'bike'
describe Bike do

  it { is_expected.to respond_to :broken? }

    it 'can be reported as broken' do
      subject.report_broken
      expect(subject.broken?).to eq true
    end

    it 'can be fixed' do
      subject.fix
      expect(subject.broken?).to eq false
    end
end