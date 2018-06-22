# frozen_string_literal: true

require 'execjs'
require 'jekyll'
require 'jekyll/latex_block/version'
require 'liquid/tag/parser'

module Jekyll
  module Tags
    # LaTeX tag, HTML rendering via KaTeX
    class LatexBlock < Liquid::Block
      def initialize(tag_name, markup, options)
        @parsed_options = Liquid::Tag::Parser.new(markup).args
        super
      end

      def katex_js
        # rubocop:disable Style/ClassVars
        @@katex ||= ExecJS.compile(File.read(katex_path))
        # rubocop:enable Style/ClassVars
      end

      def katex_path
        File.expand_path('../js/katex.js', File.dirname(__FILE__))
      end

      def render(context)
        latex_source = super
        katex_js.call('katex.renderToString', latex_source, @parsed_options)
      end
    end
  end
end

Liquid::Template.register_tag('latex', Jekyll::Tags::LatexBlock)
