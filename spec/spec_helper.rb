Bundler.require(:test)
CodeClimate::TestReporter.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'farkle'

module TestHelpers
  def log(*args)
    args.each {|arg| puts arg}
  end
end

RSpec.configure do |config|
  config.order = "random"
  config.include TestHelpers
end
