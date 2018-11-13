# Defines the Board where the Robot walks
class Board
  def initialize(attr = {})
    @squares = attr[:squares] || [[Square.new]]
    @oob = Square.new(:oob)
  end

  def square_at(position)
    row = position[1] - 1
    column = position[0] - 1
    if @squares[row] != nil && @squares[row][column] != nil
      @squares[row][column]
    else
      @oob
    end
  end

  def to_s
    print_with_robot_at(nil)
  end

  def print_with_robot_at(position = nil)
    matrix = position ? matrix_with_robot(position) : @squares
    "\n" + matrix.to_a.map(&:join).join("\n")
  end

  private

  def matrix_with_robot(position)
    row = position[1] - 1
    column = position[0] - 1
    matrix = @squares.map { |squares_row| squares_row.map(&:dup) }
    matrix[row][column] = 'R '
    matrix
  end
end
