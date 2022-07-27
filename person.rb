class Person
  attr_reader :id
  attr_accessor :name, :age, :parent_permission

  def initialize(name, age = 'Unknown', parent_permission = true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission == true
  end

  private

  def of_age?
    if @age >= 18
      true
    else
      false
    end
  end
end
