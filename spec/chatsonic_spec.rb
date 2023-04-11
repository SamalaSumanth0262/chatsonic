RSpec.describe ChatSonic do
  it "has a version number" do
    expect(::ChatSonic::VERSION).not_to be nil
  end

  describe "#configure" do
    let(:access_token) { "abc123" }
    let(:api_version) { "v2" }
    let(:custom_uri_base) { "ghi789" }
    let(:custom_request_timeout) { 25 }

    before do
      ChatSonic.configure do |config|
        config.access_token = access_token
        config.api_version = api_version
      end
    end

    it "returns the config" do
      expect(ChatSonic.configuration.access_token).to eq(access_token)
      expect(ChatSonic.configuration.api_version).to eq(api_version)
      expect(ChatSonic.configuration.uri_base).to eq("https://api.writesonic.com/")
      expect(ChatSonic.configuration.request_timeout).to eq(120)
    end

    context "without an access token" do
      let(:access_token) { nil }

      it "raises an error" do
        expect { ChatSonic::Client.new.prompt }.to raise_error(ChatSonic::ConfigurationError)
      end
    end

    context "with custom timeout and uri base" do
      before do
        ChatSonic.configure do |config|
          config.uri_base = custom_uri_base
          config.request_timeout = custom_request_timeout
        end
      end

      it "returns the config" do
        expect(ChatSonic.configuration.access_token).to eq(access_token)
        expect(ChatSonic.configuration.api_version).to eq(api_version)
        expect(ChatSonic.configuration.uri_base).to eq(custom_uri_base)
        expect(ChatSonic.configuration.request_timeout).to eq(custom_request_timeout)
      end
    end
  end
end
