$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

# Code coverage
require 'simplecov'
if ENV['CIRCLE_ARTIFACTS']
  dir = File.join(ENV['CIRCLE_ARTIFACTS'], 'coverage')
  SimpleCov.coverage_dir(dir)
end
SimpleCov.start

require 'jekyll'
require 'jekyll-latex-block'

require 'minitest/rg'
require 'minitest/autorun'
