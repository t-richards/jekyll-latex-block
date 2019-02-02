# Jekyll LaTeX Block

[![CircleCI Build Status](https://img.shields.io/circleci/project/github/t-richards/jekyll-latex-block/master.svg?style=flat-square)](https://circleci.com/gh/t-richards/jekyll-latex-block)
[![Gem Version](https://img.shields.io/gem/v/jekyll-latex-block.svg?style=flat-square)](https://rubygems.org/gems/jekyll-latex-block)

Jekyll LaTeX Block is a plugin for [Jekyll][jekyll] that uses [KaTeX][katex] to
render LaTeX at build time, without the need for client-side JavaScript.

## Requirements

Ensure that your build environment has a JavaScript interpreter supported by
[ExecJS][execjs].

## Installation

Add this gem to your project's `gems.rb` or `Gemfile`:

```ruby
group :jekyll_plugins do
  gem "jekyll-latex-block", "~> 0.10.0"
end
```

And then execute:

```bash
$ bundle
```

## Usage

In your content, you can use the `latex` block tag like so:

```latex
{% latex %}
e^{i \pi} + 1 = 0
{% endlatex %}
```

[Additional rendering options][rendering-opts] such as `displayMode` may be
specified like so:

```latex
{% latex displayMode=true %}
\int_{a}^a f(x) dx
{% endlatex %}
```

To display the resulting markup properly, you MUST include KaTeX CSS and
relevant web fonts on your site. The generated HTML _does not_ require KaTeX
client-side JavaScript.

### Easy-mode CSS & Fonts Integration :heavy_check_mark:

Place the following stylesheet inside your `<head>` tag:

```html
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.10.0/katex.min.css" integrity="sha384-9tPv11A+glH/on/wEu99NVwDPwkMQESOocs/ZGXPoIiLE8MU/qkqUcZ3zzL+6DuH" crossorigin="anonymous">
```

### Hard-mode CSS & Fonts Integration :warning:

For maximum control, you may wish to manually download KaTeX CSS / web fonts and
place them directly in your project. The author of this plugin is not
responsible for your pain and suffering should you choose to go this route.

## Contributing

After checking out the repo...

```bash
# Install dependencies, setup submodules
$ bin/setup

# Run tests
$ bin/rake test

# Run interactive prompt
$ bin/console

# Lint code for style violations
$ bin/rubocop

# Build a gem into the pkg/ directory
$ bin/rake build
```

Bug reports and pull requests are welcome on GitHub at
https://github.com/t-richards/jekyll-latex.

## License

The gem is available as open source under the terms of the [MIT License][mit-license].

[execjs]: https://github.com/rails/execjs
[jekyll]: https://jekyllrb.com
[katex]: https://katex.org
[mit-license]: https://opensource.org/licenses/MIT
[rendering-opts]: https://github.com/Khan/KaTeX#rendering-options
