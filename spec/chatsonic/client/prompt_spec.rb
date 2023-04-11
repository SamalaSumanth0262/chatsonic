RSpec.describe ChatSonic::Client do
  describe "#chat" do
    context "with input text and valid access token", :vcr do
      let(:response) do
        ChatSonic::Client.new.prompt(
          parameters: {
            enable_google_results: true,
            enable_memory: true,
            input_text: 'Hi'
          })
      end
      let(:content) { JSON.parse(response.body) }

      before do
        ChatSonic.configure do |config|
          config.access_token = ENV.fetch('API_KEY')
        end
      end

      context "with Prompt" do
        it "should successfully fetch the prompt" do
          expect(content["message"]).not_to be_empty
        end
      end
    end
  end
end
