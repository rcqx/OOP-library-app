require "./book"
require "./person"
require "./student"
require "./teacher"
require "./rental"

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
  
  # option 1: List books
  def list_books
    ObjectSpace.each_object(Book) { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
    puts "Bookshelf is currently empty!" if (ObjectSpace.each_object(Book).count == 0) == true
    puts "\n"
  end

  # option 2: List people
  def list_people
    ObjectSpace.each_object(Person) do |person|
      if person.instance_of?(Teacher)
        puts "[Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      elsif person.instance_of?(Student)
        puts "[Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      else
        puts "[Visitor] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
    puts "\n"
  end

  # create person
  def add_person
    puts "Do you want to create a student (1) or a teacher (2)? [Input the number]: "
    input = gets.chomp
    case input
    when "1"
      print "Age: "
      age = gets.chomp
      print "Name: "
      name = gets.chomp
      print "Has parent permission? [Y/N]: "
      permit = gets.chomp.upcase
      permit_arg = true if permit == "Y"
      permit_arg = false if permit == "N"
      student = Student.new(name, age, parent_permission: permit_arg)
      puts "Person created succesfully!\n\n"
    when "2"
      print "Age: "
      age = gets.chomp
      print "Name: "
      name = gets.chomp
      print "Specialization: "
      specialization = gets.chomp
      teacher = Teacher.new(name, age, specialization)
      puts "Person created succesfully!\n\n"
    end
  end

  # create book
  def add_book 
    print "Enter book title: "
    title = gets.chomp
    print "Enter book author: "
    author = gets.chomp
    book = Book.new(title, author)
    puts "Book was created successfully!\n\n"
  end

  # create rental
  def create_rental
    books_for_rental
    book_obj = select_book 
    return nil if book_obj.nil?
    
    persons_rental
    person_obj = select_person
    return nil if book_obj.nil?
    
    print "Date: "
    date = gets.chomp
    Rental.new(date, book_obj, person_obj)
    puts "Rental created successfully!\n\n"
  end

  def books_for_rental
    puts "Please select a book from the rental list:"
    ObjectSpace.each_object(Book).with_index do |book, index|
      print "#{index} Title: #{book.title}, Author: #{book.author}\n"
    end
    puts "\n"
  end

  def select_book
    book_number = gets.chomp.to_i
    book_obj = ObjectSpace.each_object(Book).with_index.find { |book, index| index == book_number }
    if book_obj.nil?
      puts "No registered book \n\n"
      return nil
    end
    book_obj[0]
  end

  def persons_rental
    puts "Please select person from list number"
    ObjectSpace.each_object(Person).with_index do |person, index|
      if person.instance_of?(Teacher)
        print "List Number: #{index} [Teacher] Name: #{person.name}, Age: #{person.age}\n"
      elsif person.instance_of?(Student)
        print "List Number: #{index} [Student] Name: #{person.name}, Age: #{person.age}\n"
      end
    end
    puts "\n"
  end
  
  def select_person
    person_number = gets.chomp.to_i
    person_obj = ObjectSpace.each_object(Person).with_index.find { |person, index| index == person_number }
    if person_obj.nil?
      puts "No registered person \n\n"
      return nil
    end
    person_obj[0]
  end

end
