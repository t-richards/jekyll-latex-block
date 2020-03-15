# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

desc 'Run mutation testing'
task :mutation do
  sh %w[
    bin/mutant
    --include lib
    --require jekyll-latex-block
    --use rspec
    --fail-fast
    --
    Jekyll::Tags::LatexBlock
  ].join(' ')
end

task default: :spec
