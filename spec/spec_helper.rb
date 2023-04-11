require "chatsonic"

RSpec.configure do |c|
  c.before(:all) do
    ChatSonic.configure do |config|
      config.access_token = ENV.fetch("API-KEY", "123abc")
    end
  end
end