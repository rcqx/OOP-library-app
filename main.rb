require "./app"

def main
  app = App.new
  app.greeter
  input = nil
  while input != "7"
    app.instructions
    input = gets.chomp
    options(input, app)
  end
end

def options(input, app)
  case input
  when "4"
    app.add_book
  when "7"
    puts "See you soon!"
  end
end  

main()
