# less-rails-semantic_ui

This is a gem for Rails with [Semantic UI](https://github.com/Semantic-Org/Semantic-UI/) assets inside.
It provide ability to customize component themes and variables on the fly in your application.

## Features

* LESS based (it is mean that it doesn't contains hacks usually used for convert LESS to SASS)
* Semantic UI configs integrated to your application (you can customize it and change styles of components on the fly)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'less-rails-semantic_ui', '~> x.x.x'
```

And then execute:

    $ bundle install

After that install configuration files inside your application to `vendor/assets` directory:

    $ rails generator semantic_ui:install

Add references to `semantic_ui/semantic_ui.js` in `app/assets/application.js`:

    ...
    //= require semantic_ui/semantic_ui
    ...

Add references to `semantic_ui/semantic_ui.css` in `app/assets/application.css`:

    ...
    *= require semantic_ui/semantic_ui
    ...

## Upgrade to new version

Execute command below and merge new and your changes in config files:

    $ rails generator semantic_ui:install

## Customization

You can modify any Semantic UI configs and files placed to `vendor/assets/javascripts/semantic_ui` and `vendor/assets/stylesheets/semantic_ui` directories.
For example:

* if you wish to remove unused components you can just remove corresponding lines from `semantic_ui.js` and `semantic_ui.css` files.
* if you wish to change components themes you can just configure them in `theme.config`.
* if you wish to change component variables or extend components you can just configure corresponding `config/{collections,elements, globals,modules,views}/*.{overrides,variables}` files.

## Contributing

1. Fork it ( https://github.com/maxd/less-rails-semantic_ui )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
