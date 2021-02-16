module Acronym
    def self.abbreviate(words)
        words.scan(/\w+/).map { |w| w[0] } .join.upcase
    end
end
