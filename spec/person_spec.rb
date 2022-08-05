require_relative '../lib/person'

describe Person do
  context 'Correct persons object instantiation along with methods' do
    let(:person) { Person.new('Craig', 37) }

    it 'can add, store and access person name correctly' do
      expect(person.name).to eq('Craig')
    end

    it 'can add, store and access person age correctly' do
      expect(person.name).to eq('Craig')
    end

    it 'can add, store and access person age correctly' do
      expect(person.name).to eq('Craig')
    end

    it 'returns correct value from can_use_services? method' do
      expect(person.can_use_services?).to be true
    end

    it 'return correct value from of_age? method' do
      person.send(:of_age?)
      expect(person.of_age?) == true
    end
  end
end
