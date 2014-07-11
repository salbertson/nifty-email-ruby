# Nifty::Email

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'nifty-email'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nifty-email

## Usage

### General example

```
NiftyEmail.token = '123abc'

email = NiftyEmail.get_email('awesome-email', full_name: 'Jim Tom')
puts email.html
puts email.text
```

### Rails example

```
# initializer

NiftyEmail.token = '123abc'

# mailer

email = NiftyEmail.get_email('awesome-email', full_name: 'Jim Tom')

mail(
  to: 'jimtom@example.com',
  subject: 'Welcome!',
  body: email.html,
  content_type: 'text/html'
)

# or with HTML and text parts

mail(to: 'jimtom@example.com', subject: 'Welcome!') do |format|
  format.html { email.html }
  format.text { email.text }
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/nifty-email/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
