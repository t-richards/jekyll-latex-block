# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

if Process.argv0 != 'bin/mutant'
  require 'simplecov'
  SimpleCov.start do
    enable_coverage :branch
    minimum_coverage line: 100, branch: 100
  end

  if ENV['CI']
    require 'codecov'
    formatters = [
      SimpleCov::Formatter::HTMLFormatter,
      SimpleCov::Formatter::Codecov
    ]
    SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new(formatters)
  end
end

require 'rspec'

RSpec.configure do |config|
  config.disable_monkey_patching!
  config.order = :random

  config.before(:suite) do
    Liquid::Template.error_mode = :strict
  end
end

require 'jekyll'
require 'jekyll-latex-block'
