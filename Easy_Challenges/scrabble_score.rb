# Scrabble Score
# Write a program that, given a word, computes the Scrabble score for that word.

# Letter Values

# You'll need the following tile scores:

# Letter  Value
# A, E, I, O, U, L, N, R, S, T    1
# D, G                            2
# B, C, M, P                      3
# F, H, V, W, Y                   4
# K                               5
# J, X                            8
# Q, Z                            10

# How to Score
# Sum the values of all the tiles used in each word. For instance, lets consider the word CABBAGE which has the following letters and point values:

# 3 points for C
# 1 point for each A (there are two)
# 3 points for B (there are two)
# 2 points for G
# 1 point for E

# Thus, to compute the final total (14 points), we count:

# 3 + 2*1 + 2*3 + 2 + 1
# => 3 + 2 + 6 + 3
# => 5 + 9
# => 14

# Al:
# - guard clause for nil at top
# - 2nd guard clause: return 0 if word.downcase.match?(/[a-z]/)
# - initialize a new instance variable to capture the score
# - call chars on the input string and iterate through that array, using inject
#   - compare the element of the current iteration against the POINTS hash using each_pair
#   - if POINTS.include?(element), score += value
# - return the score

class Scrabble
  attr_accessor :total
  attr_reader :word

  POINTS = {
    %w(a e i o u l n r s t) => 1,
    %w(d g) => 2,
    %w(b c m p) => 3,
    %w(f h v w y) => 4,
    %w(k) => 5,
    %w(j x) => 8,
    %w(q z) => 10
  }

  def initialize(word)
    return 0 if word == nil
    return 0 unless word.match?(/[a-z]/i)
    @word = word
    @total = 0
  end

  def score
    return 0 if word == nil
    return 0 unless word.match?(/[a-z]/i)
    word.downcase.chars.each do |letter|
      POINTS.each_pair do |k, v|
        k.include?(letter) ? self.total += v : next
      end
    end

    total
  end

  def self.score(word)
    self.new(word).score
  end
end