require File.expand_path('lib/chatsonic/version', __dir__)

Gem::Specification.new do |spec|
  spec.name                  = 'chatsonic'
  spec.version               = Chatsonic::VERSION
  spec.authors               = ['Samala Sumanth']
  spec.email                 = ['chintusamala96@gmail.com ']
  spec.summary               = 'ChatSonic Integration with Rails'
  spec.description           = 'This gem allows interact with ChatSonic ( An Alternative to ChatGPT-4 ) with Real Time Data Model'
  spec.homepage              = 'https://github.com/'
  spec.license               = 'MIT'
  spec.platform              = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 2.5.0'
  spec.extra_rdoc_files = ['README.md']
  spec.add_development_dependency 'rubocop', '~> 0.60'
  spec.add_development_dependency 'rubocop-performance', '~> 1.5'
  spec.add_development_dependency 'rubocop-rspec', '~> 1.37'
end