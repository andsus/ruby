module ResistorColorDuo 
    COLORS = ['black', 'brown','red','orange','yellow','green', 'blue' , 'violet','grey', 'white' ]

    def self.value(colors)
        #colors.first(2).reduce("") { |tot, c| tot + colorArr.index(c).to_s } .to_i
        colors.first(2).map { |c| COLORS.index(c) } .join("") .to_i
    end
end

