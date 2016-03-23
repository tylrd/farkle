module Farkle
  # The scoring module handles the logic for scoring a game of Farkle.
  # It expects a <code>@dice</code> instance variable in the class that is being mixed into.
  module Scoring

    # Determines if there is a one or five in the <code>@dice</code> array.
    #
    # @return [Boolean] true if there is a 1 or 5 upface value on the dice
    def one_or_five?
      @dice.any? { |die| die.upface == 1 || die.upface == 5 }
    end

    ["three", "four", "five", "six"].each_with_index do |num, index|
      define_method("#{num}_of_a_kind") { pairs(index + 3) }
    end

    def two_sets_of_three?
      three_of_a_kinds.size == 2
    end

    # Helper method for determining if there are any pairs of die with the same upface.
    #
    # @params num [Integer] how many of the same die in the roll
    # @return [Array<Integer>] the value of the pairs
    def pairs(num)
      @dice.select{ |die| @dice.count(die) == num }.map(&:upface).uniq
    end

  end
end
