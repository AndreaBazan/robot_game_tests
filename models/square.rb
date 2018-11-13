# Models the squares that compose a board
class Square
  attr_reader :result, :state

  def initialize(state = :empty)
    @result = result
    @state = state
  end
end
