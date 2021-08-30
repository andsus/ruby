class Phrase

    WORD_RE = /\b[\w']+\b/
    
    attr_reader :words
    
    def initialize(words)
        @words = words.downcase.scan(WORD_RE)
    end

    def word_count
        words.each_with_object(Hash.new(0)) {|v, h| h[v] += 1}
    end

end