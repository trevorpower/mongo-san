require 'mongo_san'
require 'rails'

module MongoSan
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'mongo_san/tasks.rb'
    end
  end
end
