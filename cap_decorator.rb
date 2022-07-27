require './main_decorator'

class CapitalizeDecorator < Decorator
  def correct_name
    @component.name.upcase
  end
end
