module Hamming
    def self.compute(strand_a, strand_b)
      raise ArgumentError, 'strands not equal length' unless strand_a.length == strand_b.length
  
      strand_a.chars.zip(strand_b.chars).each.count { |a, b| a != b }
    end
end