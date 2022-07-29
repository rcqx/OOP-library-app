require "./book"

class App
  def greeter
    print "Welcome to School Library App!\n\n"
  end
  
  def instructions
    puts "Please choose an option by entering a number:
    1 - List all books
    2 - List all people
    3 - Create a person 
    4 - Create a book
    5 - Create a rental
    6 - List all rentals for a given person id
    7 - Exit"
  end
  
  def add_book 
    print "Enter book title: "
    title = gets.chomp
    print "Enter book author: "
    author = gets.chomp
    book = Book.new(title, author)
    puts "Book was created successfully!\n\n"
  end
end
