class Scrabble
  TILES =
    {
      A: 1, N: 1,
      B: 3, O: 1,
      C: 3, P: 3,
      D: 2, Q: 10,
      E: 1, R: 1,
      F: 4, S: 1,
      G: 2, T: 1,
      H: 4, U: 1,
      I: 1, V: 4,
      J: 8, W: 4,
      K: 5, X: 8,
      L: 1, Y: 4,
      M: 3, Z: 10
    }

  def self.score(letters)
    new(letters).score
  end

  private

  attr_reader :letters, :tiles

  def initialize(letters, tiles = TILES)
    @letters = letters.to_s.upcase.chars.map(&:to_sym)
    # convert tiles key to upcase and to symbol. And created new copy of tiles
    @tiles = tiles.transform_keys(&:upcase).transform_keys(&:to_sym)
    @tiles.default = 0
  end

  public

  def score
    letters.sum(&tiles)
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
# require 'minitest/autorun'
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
