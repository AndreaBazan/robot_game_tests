# Models the squares that compose a board
class Square
  attr_reader :state

  RESULTS = {
    empty: { state: :success, appearance: '◻ ', status: {} },
    hole:  { state: :felt, appearance: '◼ ', status: { felt: 'Curiosity felt into a hole.' } },
    oob:   { state: :crashed, appearance: '○ ', status: { oob: 'Curiosity crashed into a wall.' } },
    wall:  { state: :crashed, appearance: '○ ', status: { crashed: 'Curiosity crashed into a wall.' } }
  }

  def initialize(state = :empty)
    @state = state
  end

  def result
    RESULTS[state][:status]
  end

  def to_s
    RESULTS[@state].fetch(:appearance, nil)
  end

  RESULTS.each do |state, _|
    define_singleton_method(state) do
      Square.new(state)
    end
  end
end
