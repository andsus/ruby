class Bob
  def self.hey(remark)
    new(remark).respond
  end

  def initialize(utterance)
    @utterance = Utterance.new(utterance)
  end

  def respond
    if utterance.silence?
      'Fine. Be that way!'
    elsif utterance.forceful_question?
      'Calm down, I know what I\'m doing!'
    elsif utterance.shouting?
      'Whoa, chill out!'
    elsif utterance.question?
      'Sure.'
    else
      'Whatever.'
    end
  end

  private

  attr_reader :utterance
end

class Utterance
  def initialize(utterance)
    @utterance = utterance.strip
  end

  def silence?
    utterance.empty?
  end

  def shouting?
    contains_letters? && all_uppercase?
  end

  def question?
    utterance.rstrip.end_with? '?'
  end

  def forceful_question?
    question? && shouting?
  end

  private

  attr_reader :utterance

  def contains_letters?
    utterance =~ /[[:alpha:]]/
  end

  def all_uppercase?
    utterance == utterance.upcase
  end
end
