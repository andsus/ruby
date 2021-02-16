class Series
    attr_reader :serial
    def initialize(serial)
        @serial = serial.chars
    end
    def slices(n)
        if serial.length < n 
            raise ArgumentError
        end 
        # (0..serial.length-n).map { |i| serial[i..i+n-1].join }
        # (0..serial.length-n).map do |i| 
        #     serial[i..i+n-1].join 
        # end

        # (serial).map.with_index do |e,i| 
        #     next if i + n > serial.length
        #         # serial[i..i+n-1].join
                
        #     serial.slice(i...).take(n).join           
        # end
        serial.each_cons(n).map(&:join)

    end
end

