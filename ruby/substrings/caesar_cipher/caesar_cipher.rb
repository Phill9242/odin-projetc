require 'byebug'

def caesar_cipher(string, fix_num)
  cipher = ''

  string.chars do |char|
    if char =~ /[[:alpha:]]/
      cipher << converted_char(char, fix_num)
      next
    end

    cipher << char
  end

  cipher
end

def converted_char(char, fix_num)
  ascii_pivot = char =~ /[a-z]/ ? 'a'.ord : 'A'.ord
  ((char.ord - ascii_pivot + fix_num) % 26 + ascii_pivot).chr
end

puts caesar_cipher('What a string!', 5)  # Expected 'Bmfy f xywnsl!'
