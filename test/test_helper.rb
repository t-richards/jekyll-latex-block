$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'simplecov'
SimpleCov.start

require 'jekyll'
require 'jekyll/latex'

require 'minitest/autorun'
