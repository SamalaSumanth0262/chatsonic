require File.expand_path('lib/chatsonic/version', __dir__)

Gem::Specification.new do |spec|
  spec.name                  = 'chatsonic'
  spec.version               = ChatSonic::VERSION
  spec.authors               = ['Samala Sumanth']
  spec.email                 = ['chintusamala96@gmail.com ']
  spec.summary               = 'ChatSonic Integration with Rails'
  spec.description           = 'This gem allows interact with ChatSonic ( An Alternative to ChatGPT-4 ) with Real Time Data Model'
  spec.homepage              = 'https://github.com/SamalaSumanth0262/chatsonic'
  spec.license               = 'MIT'
  spec.files                 = Dir['README.md', 'LICENSE',
                                    'CHANGELOG.md', 'lib/**/*.rb',
                                    'lib/**/*.rake',
                                    'chatsonic.gemspec', '.github/*.md',
                                    'Gemfile', 'Rakefile']
  spec.platform              = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 2.5.0'
  spec.extra_rdoc_files = ['README.md']
  spec.add_runtime_dependency 'httparty', '~> 0.18', '>= 0.18.1'
end