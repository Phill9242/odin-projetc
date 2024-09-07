def stock_picker(values)
  min = values.first
  min_day = 0
  max_day = 0
  min_day_actual = 0
  max_profit = -Float::INFINITY
  values.each_with_index do |value, day|
    next if day.zero?

    if value < min
      min = value
      min_day_actual = day
      next
    end

    next unless value - min > max_profit

    min_day = min_day_actual
    max_day = day
    max_profit = value - min
  end
  return [] if min_day >= max_day

  [min_day, max_day]
end

test_cases = {
  [17, 3, 6, 9, 15, 8, 6, 1, 10] => [1, 4],
  [7, 1, 5, 3, 6, 4] => [1, 4],
  [7, 6, 4, 3, 1] => [],
  [1, 2, 3, 4, 5, 6] => [0, 5],
  [3, 8, 6, 1, 9] => [3, 4],
  [5, 10, 4, 6, 7] => [0, 1],
  [20, 18, 12, 8, 5] => [],
  [12, 11, 15, 3, 10, 2] => [3, 4],
  [9, 7, 4, 3, 2, 1] => [],
  [1, 3, 2, 8, 4, 9] => [0, 5]
}

wrong_test = false
test_cases.each do |input, expected|
  result = stock_picker(input)
  next if result == expected

  wrong_test = true
  puts "Error: Test #{input.inspect} failled", "Expected: #{expected}", "Result: #{result}"
end

puts 'All tests passsed' unless wrong_test
