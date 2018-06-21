require 'test_helper'

module Jekyll
  class LatexTest < Minitest::Test
    include Liquid

    def setup
      euler = '{% latex %} e^{i \pi} + 1 = 0 {% endlatex %}'
      @formula = Liquid::Template.parse(euler)
    end

    def test_that_it_has_a_version_number
      refute_nil(::Jekyll::Latex::VERSION)
    end

    def test_it_renders_properly
      assert_includes(@formula.render, '<span class="katex">')
    end
  end
end
