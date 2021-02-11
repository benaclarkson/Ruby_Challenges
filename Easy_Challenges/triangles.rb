# Triangles
# Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

# An equilateral triangle has all three sides the same length.

# An isosceles triangle has exactly two sides of the same length.

# A scalene triangle has all sides of different lengths.

# Note: For a shape to be a triangle at all, all sides must be of length > 0, and the sum of the lengths of any two sides must be greater than or equal to the length of the third side.

# Al:
# - Validate input is triangle
#   Rules:
#   > All sides length > 0
#   > Sum of lengths of any two sides >= third side
#   Al:
#   - raise ArgumentError manually unless all the sides are > 0
#   - check permutations of all 3 sides to ensure that their sum is greater than the length of the side that was not in the permutation.
# - Determine the type of triangle
#   Rules:
#   > An equilateral triangle has all three sides the same length.
#   > An isosceles triangle has exactly two sides of the same length.
#   > A scalene triangle has all sides of different lengths.
#   Al:
#   - Create an if conditional that calls functions which return boolean values
#   - return appropriate string based on boolean value of function
#   - For equilateral, check if side one is the same as side 2 and side 3
#   - For isosceles, check if side one is the same as side 2, but not side 3
#     or if side 1 is the same as side 3, but not side 2
#     or if side 2 is the same as side 3, but not side 1
#   - For scalene, check if side 1 is not the same as side 2
#     and side 1 is not the same as side 3
#     and side 2 is not ht esame as side 3

class Triangle
  attr_reader :sides

  def initialize(s1, s2, s3)
    @sides = [s1, s2, s3]
    check_sides
    validate_triangle
  end

  def validate_triangle
    if sides[0] + sides[1] < sides[2]
      raise ArgumentError
    elsif sides[0] + sides[2] < sides[1]
      raise ArgumentError
    elsif sides[1] + sides[2] < sides[0]
      raise ArgumentError
    end
  end

  def check_sides
    raise ArgumentError unless sides.all? { |side| side > 0 }
  end

  def kind
    if equilateral?
      return 'equilateral'
    elsif isosceles?
      return 'isosceles'
    elsif scalene?
      return 'scalene'
    end
  end

  def equilateral?
    sides[0] == sides[1] && sides[0] == sides[2]
  end

  def isosceles?
    (sides[0] == sides[1] && sides[0] != sides[2]) ||
    (sides[0] == sides[2] && sides[0] != sides[1]) ||
    (sides[1] == sides[2] && sides[1] != sides[0])
  end

  def scalene?
    sides[0] != sides[1] && sides[0] != sides[2] && sides[1] != sides[2]
  end
end