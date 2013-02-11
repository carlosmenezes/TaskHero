PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")
require 'factory_girl'
require 'database_cleaner'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods

  #conf.use_transactional_fixtures = false
  
  conf.before(:suite) do
    DatabaseCleaner.strategy = :transaction
  end

  conf.before(:each) do
    DatabaseCleaner.start
  end

  conf.after(:each) do
    DatabaseCleaner.clean
  end
end

FactoryGirl.definition_file_paths = [
    File.join(Padrino.root, 'factories'),
    File.join(Padrino.root, 'test', 'factories'),
    File.join(Padrino.root, 'spec', 'factories')
]

FactoryGirl.find_definitions

def app
  ##
  # You can handle all padrino applications using instead:
  #   Padrino.application
  TaskHero.tap { |app|  }
end
