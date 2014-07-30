require_relative '../test_helper'
require 'capybara'
require 'sinatra'
require_relative '../../app.rb'

Capybara.app = JimmysApp

class FeatureTest < Minitest::Test
  include Capybara::DSL

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end
