require "./book"
require "./person"
require "./student"
require "./teacher"

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

  # option 4
  def add_book 
    print "Enter book title: "
    title = gets.chomp
    print "Enter book author: "
    author = gets.chomp
    book = Book.new(title, author)
    puts "Book was created successfully!\n\n"
  end
end
