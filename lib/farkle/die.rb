module Farkle
  class Die

    attr_reader :upface, :sides

    def initialize(sides = nil)
      @sides = sides || 6
    end

    def roll
      @upface = rand(@sides) + 1
    end

    def rolled?
      !upface.nil?
    end

  end
end
