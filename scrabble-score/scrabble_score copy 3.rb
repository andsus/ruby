class Scrabble
  # TILES.keys.first.is_a? String - true
  # TILES.keys.each { |key| puts key.class }
  TILES =
    {
      'a' => 1, 'n' => 1,
      'b' => 3, 'o' => 1,
      'c' => 3, 'p' => 3,
      'd' => 2, 'q' => 10,
      'e' => 1, 'r' => 1,
      'f' => 4, 's' => 1,
      'g' => 2, 't' => 1,
      'h' => 4, 'u' => 1,
      'i' => 1, 'v' => 4,
      'j' => 8, 'w' => 4,
      'k' => 5, 'x' => 8,
      'l' => 1, 'y' => 4,
      'm' => 3, 'z' => 10
    }

  def self.score(letters)
    new(letters).score
  end

  attr_reader :letters, :tiles

  def initialize(letters, tiles = TILES)
    @letters = letters.to_s.downcase.chars
    # convert tiles key to symbol and created new copy of tiles
    @tiles = tiles.transform_keys(&:to_sym)
    @tiles.default = 0
  end

  def score
    letters.map(&:to_sym).sum(&tiles)
  end
end

if $PROGRAM_NAME == __FILE__

  Hawaiian_Tiles =
    {
      'a' => 1, 'n' => 3,
      'o' => 2,
      'p' => 8,
      'e' => 4,
      'h' => 6, 'u' => 5,
      'i' => 3,
      'w' => 9,
      'k' => 2,
      'l' => 7,
      'm' => 8
    }

  puts Scrabble.new('Humuhumunukunukuapuaa', Hawaiian_Tiles).score # => 94
  puts Scrabble.new('hello').score # 8
  puts Scrabble.new('aloha', tiles = Hawaiian_Tiles).score # 17
  puts Scrabble.new('he‘e', Hawaiian_Tiles).score # => 14

end

require 'minitest/autorun'

if defined? Minitest

  Hawaiian_Tiles =
    {
      'a' => 1, 'n' => 3,
      'o' => 2,
      'p' => 8,
      'e' => 4,
      'h' => 6, 'u' => 5,
      'i' => 3,
      'w' => 9,
      'k' => 2,
      'l' => 7,
      'm' => 8
    }

  describe 'Mentor Auxilary Tests' do

    it 'must not modify my objects' do
      # give it a chance to change my tiles
      Scrabble.new('alphabet', Hawaiian_Tiles)
      actual = Hawaiian_Tiles.default
      expect(actual).must_be_nil('Must not modify the given tile set.')
    end
  end

end
