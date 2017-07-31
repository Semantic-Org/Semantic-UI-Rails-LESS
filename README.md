# less-rails-semantic_ui [![Gem Version](https://badge.fury.io/rb/less-rails-semantic_ui.svg)](http://badge.fury.io/rb/less-rails-semantic_ui) [![Build Status](https://travis-ci.org/Semantic-Org/Semantic-UI-Rails-LESS.png?branch=master)](https://travis-ci.org/Semantic-Org/Semantic-UI-Rails-LESS)

This is a gem for Rails with [Semantic UI](https://github.com/Semantic-Org/Semantic-UI/) assets inside.
It provides the ability to customize component themes and variables on the fly in your application.

## Features

* LESS based (meaning that it doesn't contains hacks usually used to convert LESS to SASS)
* Semantic UI configs integrated in your application (you can customize and change component styles on the fly)

## Installation

Add this block to your application's Gemfile:

```ruby
# Semantic UI assets

gem 'less-rails-semantic_ui', '~> x.x.x'
gem 'autoprefixer-rails', '~> x.x.x'
gem 'therubyracer'
```

> Semantic UI is using [autoprefixer](https://github.com/postcss/autoprefixer) (in our case [autoprefixer-rails](https://github.com/ai/autoprefixer-rails))
> to appending additional CSS vendor-prefixes for improve compatibility with different browsers.
> Without it some parts of Semantic UI (i.e. transitions or modal dialogs because they depends to transitions) won't works in some browsers.
> You can remove this gem if you don't use such functionality of Semantic UI.
>
> P.S. I hope in the future this hack will be unnecessary.

And then execute:

    $ bundle install

After that, install configuration files inside your application in the `vendor/assets` directory with:

    $ rails generate semantic_ui:install

Require `semantic_ui/semantic_ui.js` in `app/assets/application.js`:

    ...
    //= require semantic_ui/semantic_ui
    ...

Require `semantic_ui/semantic_ui.css` in `app/assets/application.css`:

    ...
    *= require semantic_ui/semantic_ui
    ...

## Upgrade to new version

Execute command below and merge your custom and new changes in config files:

    $ rails generate semantic_ui:install

## Customization

You can modify any Semantic UI configs and files placed to `vendor/assets/javascripts/semantic_ui` and `vendor/assets/stylesheets/semantic_ui` directories.
For example:

* if you wish to remove unused components you can just remove corresponding lines from `semantic_ui.js` and `semantic_ui.css` files.
* if you wish to change components themes you can just configure them in `theme.config`.
* if you wish to change component variables or extend components you can just configure corresponding `config/{collections,elements, globals,modules,views}/*.{overrides,variables}` files.

## Versioning

This gem will directly track the semantic versioning of the Semantic UI project. Major and minor versions
will always match to theirs, though we may have tiny patch level releases specific to this gem.

## Contributing

1. Fork it ( https://github.com/maxd/less-rails-semantic_ui )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
