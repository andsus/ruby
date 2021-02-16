=begin
Write your code for the 'Resistor Color Duo' exercise in this file. Make the tests in
`resistor_color_duo_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/resistor-color-duo` directory.
=end

module ResistorColorDuo 
    COLORS = ['black', 'brown','red','orange','yellow','green', 'blue' , 'violet','grey', 'white' ]

    def self.value(colors)
        #colors.first(2).reduce("") { |tot, c| tot + colorArr.index(c).to_s } .to_i
        colors.first(2).map { |c| COLORS.index(c) } .join("") .to_i
    end
end

