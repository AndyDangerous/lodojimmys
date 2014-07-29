$:.unshift File.expand_path("./../lib", __FILE__)

require_relative 'app'
require 'bundler'
Bundler.require
require 'csv'

run JimmysApp
