class Matrix
    attr_reader :rows , :columns

    def initialize(matrix)
        @rows = matrix.lines()
            .map{ |row| row.scan(/\d+/)
                .map( &:to_i ) } # convert char to int
        @columns = rows.transpose
    end

end
