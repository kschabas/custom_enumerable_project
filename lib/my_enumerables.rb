module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    self.my_each do |i|
      yield(i, index)
      index += 1
    end
  end

  def my_select
    result_array = []
    self.my_each { |i| result_array << i if yield i }
    result_array
  end

  def my_all?
    result = self.my_each { |i| return false unless yield(i) }
    return true unless result == false
  end

  def my_any?
    result = self.my_each { |i| return true if yield(i) }
    return false unless result == true
  end

  def my_none?
    result = my_each { |i| return false if yield(i) }
    return true unless result == false
  end

  def my_count
    return self.length unless block_given?

    result = 0
    my_each { |i| result += 1 if yield(i) }
    result
  end

  def my_map
    result_array = []
    my_each { |i| result_array << yield(i) }
    result_array
  end

  def my_inject(initial_value)
    result = initial_value
    my_each { |i| result = yield(result, i) }
    result
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
