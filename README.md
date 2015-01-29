# EnvRails

Set Rails configuration parameters using environment variables

## Installation

Add this line to your Rails application's Gemfile:

```ruby
gem 'env_rails'
```

And then execute:

    $ bundle

## Usage

This gem is a Railtie plugin. It doesn't require any special configuration.

When the Rails application starts it will pick up any environment variable matching a name like __RAILS_CONFIG.foo.bar__ and apply the value to the corresponding Rails configuration.

For example:

```
RAILS_CONFIG.action_mailer.smtp_settings.address=smtpserver.yourdomain.com
```

## Contributing

1. Fork it ( https://github.com/manastech/env_rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
