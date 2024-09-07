def bubble_sort(array)
  swaped = false
  total_iterations = 1
  array_size = array.size
  loop do
    (array_size - total_iterations).times do |i|
      next if array[i] <= array[i + 1]

      array[i], array[i + 1] = array[i + 1], array[i]
      swaped = true
    end
    break if swaped == false

    swaped = false
    total_iterations += 1
  end
end

array = [2, 6, 1, 4, 9, 3, 7]
puts "Sorting #{array} in place"
bubble_sort(array)
puts 'Result:'
print array, "\n"
