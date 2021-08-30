class Scrabble

  SCORE = Hash.new(0).tap do |char_scores|
    {
      1 => %w[a e i o u l n r s t],
      2 => %w[d g],
      3 => %w[b c m p],
      4 => %w[f h v w y],
      5 => %w[k],
      8 => %w[j x],
      10 => %w[q z],
    }.each do |score, chars|
      chars.each { |char| char_scores[char] = score }
    end
  end

  SCORES = {
    1 => %w[a e i o u l n r s t],
    2 => %w[d g],
    3 => %w[b c m p],
    4 => %w[f h v w y],
    5 => %w[k],
    8 => %w[j x],
    10 => %w[q z]
  }.each_with_object({}) { |(k, v), h| v.map { |c| h[c] = k } }

  # attr_reader :score

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


  def self.score(word)
    new(word).score
  end

end