# less-rails-semantic_ui

Rails asset wrapper for [Semantic UI](https://github.com/Semantic-Org/Semantic-UI/).
It provide ability to customize component themes and variables on the fly in your application.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'less-rails-semantic_ui'
```

And then execute:

    $ bundle install

After that install configuration files inside your application to `vendor/assets` directory.

    $ rails generator semantic_ui:install

Add references to `semantic_ui/semantic_ui.js` to `application.js`:

    ...
    //= require semantic_ui/semantic_ui
    ...

Add references to `semantic_ui/semantic_ui.css` to `application.css`:

    ...
    *= require semantic_ui/semantic_ui
    ...

## Contributing

1. Fork it ( https://github.com/[my-github-username]/less-rails-semantic_ui/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
