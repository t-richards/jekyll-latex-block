require 'jekyll'
require 'jekyll/latex_block/version'
require 'jekyll/tags/latex_block'

Liquid::Template.register_tag('latex', Jekyll::Tags::LatexBlock)
