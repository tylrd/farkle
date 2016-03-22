module Farkle
  class Dice
    extend Forwardable
    def_delegators :@dice, :size, :each
    include Enumerable

    # Initializes an instance of the <code>Farkle::Dice</code> object
    #
    # @param options [Hash] the options to create a Dice with
    # @option options [Integer] :num number of dice
    # @option options [Integer] :sides number of sides on the die
    def initialize(options = {})
      @dice = Array.new(options[:num] || 6) { Die.new(options[:sides]) }
    end

    # Rolls each dice.
    #
    # @return [Array<Farkle::Die>] The array of die that have been rolled.
    def throw
      @dice.each { |die| die.roll }
    end

    # Describes if all the dice have been thrown
    #
    # @return [Boolean] true if all dice have been thrown
    def thrown?
      @dice.all? { |die| die.rolled? }
    end

  end
end
