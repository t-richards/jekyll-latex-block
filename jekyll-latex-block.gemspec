lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll/latex_block/version'

Gem::Specification.new do |spec|
  spec.name = 'jekyll-latex-block'
  spec.version = Jekyll::LatexBlock::VERSION
  spec.authors = ['Tom Richards']
  spec.email = ['tom@tomrichards.net']

  spec.summary = 'LaTeX integration for Jekyll'
  spec.description = 'Renders LaTeX formulas to your site via KaTeX'
  spec.homepage = 'https://github.com/t-richards/jekyll-latex-block'
  spec.license = 'MIT'

  # Files in version control
  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(bin|test|vendor)/|^(Rakefile)|^\.})
  end

  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rubocop', '~> 0.59.2'
  spec.add_development_dependency 'simplecov', '~> 0.16'

  spec.add_dependency 'execjs', '~> 2.7'
  spec.add_dependency 'jekyll', '~> 3.3'
  spec.add_dependency 'liquid-tag-parser', '~> 1.9.0'
end
