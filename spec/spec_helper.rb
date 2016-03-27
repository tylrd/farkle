Bundler.require(:test)
CodeClimate::TestReporter.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'farkle'

module TestHelpers
  def log(*args)
    args.each {|arg| puts arg}
  end

  class Game
    attr_accessor :dice
    include Farkle::Scoring
  end

  class Die < Farkle::Die
    def initialize(face, sides = 6)
      super(sides)
      @upface = face
    end
  end

  def create_dice(*faces)
    faces.map { |f| Die.new(f) }
  end

  def build_array(index) 
    pairs = index + 3
    remainder = 6 - pairs
    array = Array.new(pairs) { 4 }
    array += (1..remainder).to_a
  end

end

RSpec.configure do |config|
  config.order = "random"
  config.include TestHelpers
end
