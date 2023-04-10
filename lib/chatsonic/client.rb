module ChatSonic
  class Client
    def initialize(access_token: nil, api_version: nil, service_name: nil, uri_base: nil, request_timeout: nil)
      ChatSonic.configuration.access_token  = access_token if access_token
      ChatSonic.configuration.api_version   = api_version if api_version
      ChatSonic.configuration.service_name  = service_name if service_name
      ChatSonic.configuration.uri_base      = uri_base if uri_base
      ChatSonic.configuration.request_timeout = request_timeout if request_timeout
    end

    def prompt(parameters: {})
      ChatSonic::Client.json_post(parameters: parameters)
    end

    private

    def self.json_post(parameters:)
      HTTParty.post(
        uri,
        headers: headers,
        body: parameters&.to_json,
        timeout: ChatSonic.configuration.request_timeout,
        verify: false
      )
    end
    
    def self.headers
      {
        "Content-Type" => "application/json",
        "accept" => "application/json",
        "X-API-KEY" => ChatSonic.configuration.access_token
      }
    end

    def self.uri
      ChatSonic.configuration.uri_base + ChatSonic.configuration.api_version + "/business/content/" + ChatSonic.configuration.service_name + "?engine=premium"
    end
  end
end