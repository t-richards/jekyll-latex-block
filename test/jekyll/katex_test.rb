require 'test_helper'

module Jekyll
  class LatexTest < Minitest::Test
    include Liquid

    def setup; end

    def test_that_it_has_a_version_number
      refute_nil(::Jekyll::Latex::VERSION)
    end

    def test_it_renders_properly
      euler = '{% latex %} e^{i \pi} + 1 = 0 {% endlatex %}'
      tag = Liquid::Template.parse(euler)
      assert_includes(tag.render, '<span class="katex">')
    end

    def test_it_parses_args_properly
      fancy = '{% latex displayMode=true %} e^{i \pi} + 1 = 0 {% endlatex %}'
      tag = Liquid::Template.parse(fancy)
      assert_includes(tag.render, '<span class="katex-display">')
    end
  end
end
