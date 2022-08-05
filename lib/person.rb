require_relative '../decorators/nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :parent_permission, :rentals

  def initialize(name, age = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission == true
  end

  def correct_name
    name
  end

  def add_rental(rental)
    @rentals.push(rental.book)
    rental.book.rentals << rental.person
  end

  private

  def of_age?
    @age >= 18
  end
end
