# Themify

[![Build Status](https://api.travis-ci.org/alex88/themify.svg)][travis]

[travis]: https://travis-ci.org/alex88/themify

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'themify'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install themify

## Usage

### CSS

Use an initializer to add one or more templates:

```ruby
Themify.add_template(Themify::Template.new('light', {'main' => '#00ccff', 'secondary' => '#121234'}))
Themify.add_template(Themify::Template.new('dark', {'main' => '#aa33ff', 'secondary' => '#565667'}))
```

Create a new file with extension `.css.sass.template` and use variables with prefix `$template_`.
For example this template:

```ruby
.label
  background: $template_main
```

generates

```css
/* Template 1 */
.template-light .label {
  background: #00ccff;
}

/* Template 2 */
.template-dark .label {
  background: #aa33ff;
}
```

now you've just to create a parent element with the corresponding theme class.

### Javascript

You can also access templates via javascript by requiring the library in your assets pipeline:

```coffeescript
#= require themify
```

then you can use `window.Themify.templates` to have the array of templates like this:

```json
[
  {
    "name": "light",
    "colors": {
      "main": "#00ccff",
      "secondary": "#121234"
    }
  },
  {
    "name": "dark",
    "colors": {
      "main": "#aa33ff",
      "secondary": "#565667"
    }
  }
]
```

## Contributing

1. Fork it ( https://github.com/alex88/themify/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
