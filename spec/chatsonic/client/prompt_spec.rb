RSpec.describe ChatSonic::Client do
  describe "#chat" do
    context "with input text and valid access token", :vcr do
      let(:mocked_response) do
        {
          message: "Hello! How can I assist you today?",
          image_urls: []
        }
      end
      before do
        ChatSonic.configure do |config|
          config.access_token = "dummy_token"
        end
      end

      context "with Prompt" do
        xit "should successfully fetch the prompt" do
          allow_any_instance_of(ChatSonic::Client.new).to receive(:prompt).and_return(mocked_response)
          result = ChatSonic::Client.new.prompt(parameters: {
              enable_google_results: true,
              enable_memory: true,
              input_text: 'Hi'
            })
        end
      end
    end
  end
end
