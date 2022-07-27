require "./main_decorator"

class TrimmerDecorator < Decorator
  def correct_name
    if @component.correct_name.length > 10
      res = []
      array = @component.correct_name.split('')
      array.each_with_index do |n, index|
          res.push(n)
          if index == 9
            return res.join()
          end
      end
    end
    @component.correct_name
  end
end
