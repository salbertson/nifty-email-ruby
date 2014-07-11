require 'json'

class NiftyEmail
  def self.token=(token)
    @token = token
  end

  def self.token
    @token
  end

  def self.get_email(slug_or_id, placeholders)
    connection = Faraday.new(url: 'http://nifty-email-production.herokuapp.com/api/emails')
    connection.authorization('Token', token: @token)

    response = connection.get("#{slug_or_id}.json", placeholders)
    NiftyEmail::Email.new(JSON.parse(response.body))
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
