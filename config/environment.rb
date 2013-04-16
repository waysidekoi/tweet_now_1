# Set up gems listed in the Gemfile.
# See: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'rubygems'

require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'logger'

require 'sinatra'
require "sinatra/reloader" if development?
require 'twitter'
require 'erb'

# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

# Set up the database and models
require APP_ROOT.join('config', 'database')

Twitter.configure do |config|
  config.consumer_key = "W3JUvorXUNFdO2lOZncfg"
  config.consumer_secret = "UGYL500GQk6pZRbuPA6UDrX02Wn9q5JyAvE7GWxEHw"
  config.oauth_token = "228571011-6AKK6OJc2wPKSaaDpH4YSA5dN5haF1elIkml9QdR"
  config.oauth_token_secret = "dBDddCzovTDKwtHcWXG89m5ArBqtACadylCTzL7hJ6A"
end
