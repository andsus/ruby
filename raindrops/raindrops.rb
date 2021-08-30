class Raindrops

  RULES = {
    3 => "Pling",
    5 => "Plang",
    7 => "Plong"
  }

  def self.convert(integer)
    new(integer).to_s
  end

  private

    attr_reader :drip, :rules

    def initialize(drip, rules = RULES)
      @drip = drip
      @rules = rules
    end

    def translate
      @translate ||= rules.each_with_object(rhythm = '') do |(factor, note)|
          rhythm << note if (drip % factor).zero?
      end
    end

    def filter
      translate.empty? ? drip : translate
    end

  public

    def to_s
      filter.to_s
    end
end

if $PROGRAM_NAME == __FILE__

  fizz_buzz = {
    3 => 'Fizz',
    5 => 'Buzz'
  }
  -15.upto 15 do |drop|
    puts Raindrops.new(drop, fizz_buzz)
  end

  if defined?(Minitest)

    describe "Raindrops extra test" do

      fizz_buzz = {
        3 => 'Fizz',
        5 => 'Buzz'
      }
      it "FizzBuzz rules" do
        assert_equal "Fizz", Raindrops.new(3, fizz_buzz).to_s
      end

    end

  end

end
