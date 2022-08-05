require_relative '../lib/book'

describe Book do 
  context 'To instantiate correctly a book object and its methods' do
    
    let(:book) { Book.new('LOTR', 'Tolkien') }

    it 'can add, store and access book title' do
      expect(book.title).to eq('LOTR')
    end

    it 'can add, store and access book author' do
      expect(book.author).to eq('Tolkien')
    end

    it "when book created there must not be rentals" do
      expect(book.rentals.length == 0).to be_truthy
    end
  end
end
