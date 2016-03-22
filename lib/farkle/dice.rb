module Farkle
  class Dice
    extend Forwardable
    def_delegators :@dice, :size, :each
    include Enumerable

    def initialize(options = {})
      @dice = Array.new(options[:num] || 6) { Die.new(options[:sides]) }
    end

    def throw
      @dice.each {|die| die.roll }
    end

    def thrown?
      @dice.all? {|die| die.rolled? }
    end

  end
end
