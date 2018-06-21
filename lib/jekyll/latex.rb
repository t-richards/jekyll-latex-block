# frozen_string_literal: true

require 'execjs'
require 'jekyll'
require 'jekyll/latex/version'

module Jekyll
  module Tags
    # LaTeX tag, html rendering via KaTeX
    class LatexBlock < Liquid::Block
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
        katex_js.call('katex.renderToString', latex_source)
      end
    end
  end
end

Liquid::Template.register_tag('latex', Jekyll::Tags::LatexBlock)
