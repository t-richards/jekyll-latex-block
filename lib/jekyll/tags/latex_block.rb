# frozen_string_literal: true

require 'execjs'
require 'liquid/tag/parser'

module Jekyll
  module Tags
    # LaTeX tag, HTML rendering via KaTeX
    class LatexBlock < Liquid::Block
      KATEX_PATH = File.expand_path(
        '../../js/katex.js', File.dirname(__FILE__)
      ).freeze
      KATEX_JS = ExecJS.compile(File.read(KATEX_PATH)).freeze

      def initialize(_tag_name, markup, _options)
        @parsed_options = Parser.new(markup).args
        super
      end

      def render(_context)
        latex_source = super
        KATEX_JS.call('katex.renderToString', latex_source, @parsed_options)
      end
    end
  end
end
