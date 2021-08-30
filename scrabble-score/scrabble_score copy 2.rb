class Scrabble

  SCORES = {
    1 => %w[a e i o u l n r s t],
    2 => %w[d g],
    3 => %w[b c m p],
    4 => %w[f h v w y],
    5 => %w[k],
    8 => %w[j x],
    10 => %w[q z]
  }.each_with_object({}) { |(k, v), h| v.map { |c| h[c] = k } }

  def initialize(letter)
    @letter = letter.to_s.strip
  end

  def score
    @letter
        .chars
        .map(&:downcase)
        .map(&SCORES)
        .sum
  end

  def self.score(letter)
    new(letter).score
  end

end