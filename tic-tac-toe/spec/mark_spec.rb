require './mark'

RSpec.describe Mark do
  let(:naught) { Mark.new('o') }

  describe '#initialize' do
    it 'is has a naught' do
      expect(naught.type).to eq('o')
    end
  end
end