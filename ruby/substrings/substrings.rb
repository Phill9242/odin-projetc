def substrings_includes(string, dictionary)
  hash = Hash.new(0)
  splited_string = string.downcase.split
  dictionary.each do |word|
    total_sightings = splited_string.select { |s| s.include?(word) }.count
    next if total_sightings.zero?

    hash[word] += total_sightings
  end
  hash
end

def substrings_scan(string, dictionary)
  hash = Hash.new(0)
  dictionary.each do |word|
    total_sightings = string.downcase.scan(/#{word}/).count
    hash[word] += total_sightings unless total_sightings.zero?
  end
  hash
end

dictionary = %w[below down go going horn how howdy it i low own part partner sit]
tests = {
  'below' => {
    'below' => 1,
    'low' => 1
  },
  "Howdy partner, sit down! How's it going?" => {
    'down' => 1,
    'go' => 1,
    'going' => 1,
    'how' => 2,
    'howdy' => 1,
    'it' => 2,
    'i' => 3,
    'own' => 1,
    'part' => 1,
    'partner' => 1,
    'sit' => 1
  }
}

puts "Dicionary = #{dictionary}\n\n"

tests.each do |string, result|
  puts "Testing with \"#{string}\""
  puts 'Result:', substrings_includes(string, dictionary)
  puts 'Expected:', result, "\n"
end

puts 'Execution time test:'

# INCLUDES TIME TEST:
GC.start
time = Time.now
10000.times do
  tests.each_key { |string| substrings_includes(string, dictionary) }
end
puts 'With includes:'
puts Time.now - time

# INCLUDES TIME TEST:
GC.start
time = Time.now
10000.times do
  tests.each_key { |string| substrings_scan(string, dictionary) }
end
puts 'With scan:'
puts Time.now - time
