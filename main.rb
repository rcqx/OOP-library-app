require './app'

def main
  app = App.new
  app.greeter
  input = nil
  while input != '7'
    app.instructions
    input = gets.chomp
    options(input, app)
  end
end

def options(input, app)
  case input
  when '1'
    app.list_books
  when '2'
    app.list_people
  when '3'
    app.add_person
  when '4'
    app.add_book
  when '5'
    app.create_rental
  when '6'
    app.list_rentals
  end
end

main
