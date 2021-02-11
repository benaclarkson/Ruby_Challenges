# Point Mutations
# Write a program that can calculate the Hamming distance between two DNA strands.

# A mutation is simply a mistake that occurs during the creation or copying of a nucleic acid, in particular DNA. Because nucleic acids are vital to cellular functions, mutations tend to cause a ripple effect throughout the cell. Although mutations are technically mistakes, a very rare mutation may equip the cell with a beneficial attribute. In fact, the macro effects of evolution are attributable by the accumulated result of beneficial microscopic mutations over many generations.

# The simplest and most common type of nucleic acid mutation is a point mutation, which replaces one base with another at a single nucleotide.

# # By counting the number of differences between two homologous DNA strands taken from different genomes with a common ancestor, we get a measure of the minimum number of point mutations that could have occurred on the evolutionary path between the two strands.

# This is called the Hamming distance.

# Copy Code
# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT
# ^ ^ ^  ^ ^    ^^
# The Hamming distance between these two DNA strands is 7.

# The Hamming distance is only defined for sequences of equal length. If you have two sequences of unequal length, you should compute the Hamming distance over the shorter length.

# Al:
# - Measuring by the length of the smaller strand, compare characters
# - if they match, move along to the next.
# - if they don't, add 1 to the tally
# - if one exceeds the other, stop the function

class DNA
  attr_accessor :distance
  attr_reader :strand1

  def initialize(strand1)
    return 0 if strand1 == ''
    @strand1 = strand1
    @distance = 0
  end

  def hamming_distance(strand2)
    return 0 if strand2 == ''
    self.distance = 0
    compare_strands(strand1.chars, strand2.chars)
    distance
  end

  def compare_strands(s1, s2)
    s1.each_with_index do |base, idx|
      if s2[idx] == nil
        break
      elsif base != s2[idx]
        self.distance += 1
      end
    end
  end
end