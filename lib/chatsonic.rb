require "openssl"
require "httparty"

require_relative "chatsonic/client"

module ChatSonic
  class Error < StandardError; end
  class ConfigurationError < Error; end

  class Configuration
    attr_writer :access_token, :service_name, :api_version, :uri_base, :request_timeout
    attr_accessor :access_token, :service_name, :api_version, :uri_base, :request_timeout
    
    DEFAULT_API_VERSION     = "v2".freeze
    DEFAULT_URI_BASE        = "https://api.writesonic.com/".freeze
    DEFAULT_REQUEST_TIMEOUT = 120
    DEFAULT_SERVICE_NAME    = "chatsonic".freeze

    def initialize
      @access_token    = nil
      @api_version     = DEFAULT_API_VERSION
      @uri_base        = DEFAULT_URI_BASE
      @request_timeout = DEFAULT_REQUEST_TIMEOUT
      @service_name    = DEFAULT_SERVICE_NAME
    end

    def access_token
      return @access_token if @access_token

      error_text = "WriteSonic Access Token is missing! you can have token from here https://app.writesonic.com/settings/api"
      raise ConfigurationError, error_text
    end
  end

  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= ChatSonic::Configuration.new
  end

  def self.configure
    yield configuration
  end
end