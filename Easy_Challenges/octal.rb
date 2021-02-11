# Octal
# Implement octal to decimal conversion. Given an octal input string, your program should produce a decimal output. Treat invalid input as octal 0.

# Note: Implement the conversion yourself. Don't use any built-in or library methods that perform the necessary conversions for you. In this exercise, the code necessary to perform the conversion is what we're looking for,

# About Octal (Base-8)

# Decimal is a base-10 system. A number 233 in base 10 notation can be understood as a linear combination of powers of 10:

# The rightmost digit gets multiplied by 100 = 1
# The next digit gets multiplied by 101 = 10
# The digit after that gets multiplied by 102 = 100
# The digit after that gets multiplied by 103 = 1000
# ...
# The n*th* digit gets multiplied by 10n-1.
# All of these values are then summed.

# Thus:
#   233 # decimal
# = 2*10^2 + 3*10^1 + 3*10^0
# = 2*100  + 3*10   + 3*1

# Octal numbers are similar, but the use powers of 8 instead of powers of 10. Thus:
#   233 # octal
# = 2*8^2 + 3*8^1 + 3*8^0
# = 2*64  + 3*8   + 3*1
# = 128   + 24    + 3
# = 155

# Al:
# - Validate that input is octal
#   Rules:
#   > Can only contain integers from 0-7
#   Al:
#   - return 0 unless input.match?(/[0-7]+/)
# - power = 0
# - input.to_i.digits.map (don't reverse since we want to iterate from 1's place upwards)
#   - element * (8**power)
#   - power += 1
# - sum input

class Octal
  attr_reader :octal_num

  def initialize(octal_num)
    @octal_num = octal_num
  end

  def to_decimal
    return 0 if octal_num.match?(/[^0-7]/)

    power = -1

    octal_num.to_i.digits.map do |digit|
      power += 1
      digit * (8**power)
    end.sum
  end
end