require_relative '../lib/rental'
require_relative '../lib/book'
require_relative '../lib/person'

describe Rental do
  context 'Correct rental object instantiation and retrieval of obj instance vars' do
    let(:book) { Book.new('LOTR', 'Tolkien') }
    let(:person) { Person.new('Jose', 33) }
    let(:rental) { Rental.new('2022-08-05', book, person) }

    it 'received and accepts book and person objects as inputs' do
      expect(rental.book).to be_a Book
      expect(rental.person).to be_a Person
    end

    it 'can access rental instance vars' do
      expect(rental.date).to eq('2022-08-05')
      expect(rental.book.title).to eq('LOTR')
      expect(rental.person.age).to eq(33)
    end
  end
end
