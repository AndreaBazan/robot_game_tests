require 'pry-byebug'

# Models the Robor behavior for the game
class Robot
  FACINGS = [:south, :east, :north, :west]
  attr_reader :facing

  def initialize(attr = {})
    @position = attr[:position] || [1, 1]
    @facing_index = facing_index(attr[:facing]) || 0 # south
    @facing = facing
    @errors = {}
    @board = attr[:board] || Board.new
  end

  def position
    @position
  end

  def move(executions = 1)
    executions.times do
      break if @errors.any?
      change_position
      check_errors
    end
    self
  end

  def turn_left
    @facing_index += 1
    @facing_index %= 4
    update_facing
    self
  end

  def turn_right
    @facing_index -= 1
    @facing_index %= 4
    update_facing
    self
  end

  def errors
    @errors
  end

  def inspect
    if errors.any?
      errors
    else
      @board.print_with_robot_at(@position)
    end
  end

  private

  def update_facing
    @facing = FACINGS[@facing_index]
  end

  def facing_index(facing)
    facing if facing.is_a? Integer
    FACINGS.index(facing&.to_sym)
  end

  def change_position
    case @facing
    when :south then @position[1] +=1
    when :north then @position[1] -=1
    when :west then @position[0] -= 1
    when :east then @position[0] += 1
    end
  end

  def check_errors
    result = @board.square_at(@position).result
    @errors.merge!(result) unless result.nil?
  end
end
