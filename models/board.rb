# Defines the Board where the Robot walks
class Board
  def initialize(attr = {})
    @squares = attr[:squares]
    @oob = Square.new(:oob)
  end

  def square_at(position) # [1,1] [3,3], [2,4]
    row = position[1] - 1
    column = position[0] - 1
    if @squares[row] != nil && @squares[row][column] != nil
      @squares[row][column]
    else
      @oob
    end
  end

  # def to_s
    
  # end
end

# @squares = [
#   [1,2,3,4],
#   [5,6,7,8],
#   [9,0,1,2]
# ]