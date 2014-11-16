require 'json'
require 'faraday'

class NiftyEmail
  class NiftyEmailError < StandardError; end

  def self.api_token=(api_token)
    @api_token = api_token
  end

  def self.get_email(slug_or_id, placeholders = {})
    connection = Faraday.new(url: 'http://nifty-email-production.herokuapp.com/api/emails')
    connection.authorization('Token', token: @api_token)

    response = connection.get("#{slug_or_id}.json", placeholders)

    if response.status == 200
      NiftyEmail::Email.new(JSON.parse(response.body))
    else
      raise NiftyEmailError, JSON.parse(response.body)['error']
    end
  end

  class Email
    attr_reader :html
    attr_reader :text

    def initialize(email_parts)
      @html = email_parts.fetch('html')
      @text = email_parts.fetch('text')
    end
  end
end
