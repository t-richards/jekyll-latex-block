# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Jekyll::LatexBlock do
  it 'has a version number' do
    expect(::Jekyll::LatexBlock::VERSION).to_not eq(nil)
  end

  context '#render' do
    it 'is renderable' do
      euler = '{% latex %} e^{i \pi} + 1 = 0 {% endlatex %}'
      tag = Liquid::Template.parse(euler)
      expect(tag.render).to include('<span class="katex">')
    end

    it 'parses arguments' do
      fancy = '{% latex displayMode=true %} e^{i \pi} + 1 = 0 {% endlatex %}'
      tag = Liquid::Template.parse(fancy)
      expect(tag.render).to include('<span class="katex-display">')
    end
  end
end
