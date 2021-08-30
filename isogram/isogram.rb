class Isogram

  def self.isogram?(words)
    alphabets = words.downcase.scan(/[[:alpha:]]/)
    alphabets == alphabets.uniq
  end

end