class Series
    attr_reader :serial
    def initialize(serial)
        @serial = serial.chars
    end
    def slices(n)
        raise ArgumentError if serial.length < n 
        serial.each_cons(n).map(&:join)
    end
end

