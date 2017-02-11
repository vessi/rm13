# frozen_string_literal: true
require 'bundler/setup'
require 'webmachine'
require 'webmachine/trace'
require 'mongoid'
require 'pry'

$LOAD_PATH.unshift '.'

Mongoid.load!(File.expand_path('../config/mongoid.yml', __FILE__), :development)

Dir['models/**/*'].each { |model| require model }
Dir['resources/**/*'].each { |resource| require resource }

application = Webmachine::Application.new do |app|
  app.configure do |config|
    config.ip = '127.0.0.1'
    config.port = 3000
    config.adapter = :WEBrick
  end
  app.routes do
    add ['trace', :*], Webmachine::Trace::TraceResource
    add [], HelloResource
    add ['kudos', :id], KudoResource
    add ['kudos'], KudosResource
  end
end

application.run
