group :development do 
  guard :rspec, cmd: 'bundle exec rspec' do
    watch(%r{^spec/.+_spec\.rb$})
    watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
    watch('spec/spec_helper.rb')  { "spec" }
  end

  guard :rubocop, cli: ['--lint'] do 
    watch(%r{^lib/(.+).rb$})
  end
end
