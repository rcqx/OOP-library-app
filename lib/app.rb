require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class App
  attr_accessor :books

  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

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

  # option 1: List books
  def list_books
    @books.each do |book|
      puts "[#{book.class}] Title: #{book.title}, Author: #{book.author}"
    end
    puts 'Bookshelf is currently empty!' if @books.count.zero?
    puts "\n"
  end

  # option 2: List people
  def list_people
    @persons.each do |person|
      if person.instance_of?(Teacher)
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      else person.instance_of?(Student)
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end      
    end
    puts 'No registered users!' if @persons.count.zero?
    puts "\n"
  end

  # rubocop:disable Metrics/MethodLength
  def add_person
    puts 'Do you want to create a Student (1) or a Teacher (2)? [Input number]: '
    input = gets.chomp
    case input
    when '1'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Has parent permission? [Y/N]: '
      permit = gets.chomp.upcase
      permit_arg = true if permit == 'Y'
      permit_arg = false if permit == 'N'
      @persons << Student.new(name, age, parent_permission: permit_arg)
      puts "Person created succesfully!\n\n"
    when '2'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Specialization: '
      specialization = gets.chomp
      @persons << Teacher.new(name, age, specialization)
      puts "Person created succesfully!\n\n"
    end
  end
  # rubocop:enable Metrics/MethodLength

  # create book
  def add_book
    print 'Enter book title: '
    title = gets.chomp
    print 'Enter book author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts "Book was created successfully!\n\n"
  end

  # create rental
  def create_rental
    if @books.count.zero?
      puts "There are no books stored in the system\n\n"
      return nil
    end

    if @persons.count.zero?
      puts "There are no persons stored in the system\n\n"
      return nil
    end

    books_for_rental
    book_obj = select_book
    return nil if book_obj.nil?

    persons_rental
    person_obj = select_person
    return nil if book_obj.nil?

    print 'Date: '
    date = gets.chomp
    @rentals << Rental.new(date, book_obj, person_obj)
    puts "Rental created successfully!\n\n"
  end

  # list rental by id
  def list_rentals
    print 'Enter ID: '
    person_id = gets.chomp
    rentals = @rentals.select { |rental| rental.person[0].id.to_i == person_id.to_i }    
    rentals.each do |rental|
      print "Date: #{rental.date}, #{rental.book[0].title} by #{rental.book[0].author} Person: #{rental.person[0].name}\n"
    end
    puts 'There are not rentals registered under that ID number :(' if rentals == []
    puts "\n"
  end

  private 

  def books_for_rental
    puts 'Please select a book using the rental list number:'
    @books.each_with_index do |book, index| 
      print "List Number --> #{index} Title: #{book.title}, Author: #{book.author}\n"
    end
    puts "\n"
  end

  def select_book
    book_number = gets.chomp.to_i
    book_obj = @books.each_with_index.find { |book, index| index == book_number }
    if book_obj.nil?
      puts "No registered book \n\n"
      return nil
    end
    book_obj
  end

  def persons_rental
    puts 'Please select person using the list number'
    @persons.each_with_index do |person, index|
      if person.instance_of?(Teacher)
        print "List Number --> #{index} [Teacher] ID: #{person.id} Name: #{person.name}, Age: #{person.age}\n"
      elsif person.instance_of?(Student)
        print "List Number --> #{index} [Student] ID: #{person.id} Name: #{person.name}, Age: #{person.age}\n"
      end
    end
    puts "\n"
  end

  def select_person
    person_number = gets.chomp.to_i
    person_obj = @persons.each_with_index.find { |person, index| index == person_number }
    if person_obj.nil?
      puts "No registered person \n\n"
      return nil
    end
    person_obj
  end
end
