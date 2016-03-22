module Farkle
  class Die

    attr_reader :upface, :sides

    # Initializes a new instance of <code>Farkle::Die</code object
    #
    # @param [Integer] the number of sides for the die object. Defaults to 6.
    # @example
    #   Farkle::Die.new(15)
    #
    #   # default constructor returns 6
    #   Farkle::Die.new
    def initialize(sides = nil)
      @sides = sides || 6
    end

    # Sets the upface of the die to a number between 1 and sides
    #
    # @return [Integer] the upface value
    def roll
      @upface = rand(@sides) + 1
    end

    # Describes if the die has been thrown or not
    #
    # @return [Boolean] true if the die has been throw 
    def rolled?
      !upface.nil?
    end

  end
end
