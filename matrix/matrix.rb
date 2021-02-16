class Matrix
    attr_reader :rows , :columns

    def initialize(matrix_string)
        @rows = matrix_string.lines
            .map{ |row| row.split
                .map( &:to_i ) } # convert char to int
        @columns = rows.transpose
    end

end
