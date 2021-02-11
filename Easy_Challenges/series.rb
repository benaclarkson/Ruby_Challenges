# Series
# Write a program that will take a string of digits and return all the possible consecutive number series of a specified length in that string.

# For example, the string "01234" has the following 3-digit series:
# 012
# 123
# 234

# Likewise, here are the 4-digit series:
# 0123
# 1234

# Finally, if you ask for a 6-digit series from a 5-digit string, you should throw an error.

# Al:
# - Convert string input into an array of integers
# - Iterate through the array
#   - Upon each iteration, slice from current element up to the value passed into
#     the slices method
#   * UNLESS the index of where we're trying to slice up to is invalid
#   - Push that array of elements into the result array

class Series
  attr_reader :nums
  attr_accessor :result

  def initialize(str)
    @nums = str.chars.map!(&:to_i)
    @result = []
  end

  def slices(num_of_slices)
    raise ArgumentError if num_of_slices > nums.size

    nums.each_with_index do |num, idx|
      if nums[(idx + num_of_slices) - 1]
        self.result << nums.slice(nums.index(num), num_of_slices)
      end
    end

    result
  end
end