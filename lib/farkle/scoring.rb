module Farkle
  # The scoring module handles the logic for scoring a game of Farkle.
  module Scoring

    # The scoring hash for the Farkle game. 
    POINTS = {
      one: 50,
      five: 100,
      four_of_a_kind: 1000,
      five_of_a_kind: 2000,
      six_of_a_kind: 3000,
      straight: 1500,
      three_pairs: 1500,
      four_plus_pair: 1500,
      two_sets_of_three: 2500
    }

    # Determines if there is a one or five in the dice.
    # @param dice [Array<Farkle::Die>] the dice in question
    # @return [Boolean] true if there is a 1 or 5 upface value on the dice
    def one_or_five?(*dice)
      dice.any? { |die| die.upface == 1 || die.upface == 5 }
    end

    # Returns the die number that matches a die that appears three time in the role 
    # @param dice [Array<Farkle::Die>] the dice in question
    # @return [Array<Integer>] an array of the three of a kind die
    def three_of_a_kind(*dice)
      pairs(3, *dice)
    end

    def three_of_a_kind?(*dice)
      three_of_a_kind(*dice).any?
    end

    def four_of_a_kind?(*dice)
      pairs(4, *dice).any?
    end

    def five_of_a_kind?(*dice)
      pairs(5, *dice).any?
    end

    def six_of_a_kind?(*dice)
      pairs(6, *dice).any?
    end

    def two_sets_of_three?(*dice)
      three_of_a_kind(*dice).size == 2
    end

    def straight?(*dice)
      dice.sort.each_with_index.all? { |die, i| die.upface == (i + 1) }
    end

    def three_pairs?(*dice)
      pairs(2, *dice).size == 3
    end

    def four_plus_pair?(*dice)
      pairs(4, *dice).any? && pairs(2, *dice).any?
    end

    # Helper method for determining if there are any pairs of die with the same upface.
    # @param num [Integer] how many of the same die in the roll
    # @param dice [Array<Farkle::Die>] the dice in question
    # @return [Array<Integer>] the upface value of the pairs
    def pairs(num, *dice)
      dice.select { |die| dice.count(die) == num }.map(&:upface).uniq
    end

  end
end
