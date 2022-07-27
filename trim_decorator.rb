require './main_decorator'

class TrimmerDecorator < Decorator
  def correct_name
    if @component.correct_name.length > 10
      res = []
      array = @component.correct_name.chars
      array.each_with_index do |n, index|
        res.push(n)
        return res.join if index == 9
      end
    end
    @component.correct_name
  end
end
