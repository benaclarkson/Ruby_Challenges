# Anagrams
# Write a program that takes a word and a list of possible anagrams and selects the correct sublist that contains the anagrams of the word.

# For example, given the word "listen" and a list of candidates like "enlists", "google", "inlets", and "banana", the program should return a list containing "inlets". Please read the test suite for the exact rules of anagrams.

# Al:
# - result = []
# - downcase everything
# - create a duplicate of the array
# - delete the search word from the dup
# - iterate through the array
#   - call chars on each string
#   - call sort on each string
#   - call join('') on each string
# - dup.each_with_index { |string, idx| string == search_word ? result << array[idx] : next }

class Anagram
  attr_reader :search_word

  def initialize(search_word)
    @search_word = search_word
  end

  def match(arr)
    result = []

    wrd = search_word.downcase.chars.sort.join('')

    dup_arr = arr.map(&:downcase)
                 .map! { |w| w == search_word ? '' : w.chars.sort.join('') }

    dup_arr.each_with_index do |string, idx|
      if string == wrd
        result << arr[idx]
      else
        next
      end
    end

    result
  end
end