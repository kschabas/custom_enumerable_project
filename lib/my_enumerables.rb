module Enumerable
  # Your code goes here
  def my_each_with_index
    for i in 0...self.length do
      yield(self[i], i)
    end
    self
  end

  def my_select
    result_array = []
    for i in self do
      result_array << i if yield(i)
    end
    result_array
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in self do
      yield(i)
    end
    self
  end
end
