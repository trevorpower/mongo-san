require 'uri'

def heroku_env(app)
  config_out = `heroku config --app #{app} --long`
  Hash[*config_out.scan(/(\w*)\s* => (.*)/).to_a.flatten]
end

namespace :heroku do
  namespace :mongo do
    desc "Dump the mongo db content"
    task :dump => :environment do
      each_heroku_app do |name, app|
        puts "#{name}:"
        uri = URI.parse(heroku_env(app)["MONGOHQ_URL"])
        db = uri.path.delete '/'
        puts `mongodump -h #{uri.host}:#{uri.port} -u #{uri.user} -p #{uri.password} -d #{db}`
        puts `ln -sf #{db} dump/#{name}`
      end
    end

    desc "Restore the mongo db content from a dump"
    task :restore, [:alias]  => :environment do
      each_heroku_app do |name, app|
        puts "#{name}:"
        uri = URI.parse(heroku_env(app)["MONGOHQ_URL"])
        db = uri.path.delete '/'
        puts `mongorestore -h #{uri.host}:#{uri.port} -u #{uri.user} -p #{uri.password} -d #{db} dump/#{args[:alias] || name}`
      end
    end
  end
end
