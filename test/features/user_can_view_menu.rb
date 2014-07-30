require_relative './feature_test_helper'

class UserCanViewMenu < FeatureTest
  def test_a_user_can_view_top_level_pages
    visit '/'
    assert_equal 200, page.status_code
    assert page.has_content?('Innovative American Cuisine')
    assert page.has_link?('About Us')
    click_link('About Us')
    assert_equal 200, page.status_code
    assert page.has_content?('Reviews')
    assert page.has_link?('Location')
    click_link('Location')
    assert_equal 200, page.status_code
    assert page.has_content?('Hours & Location')
  end

  def test_a_user_can_view_menu_pages
    visit '/'
    assert_equal 200, page.status_code
    assert page.has_link?('Menu')
    click_link('Menu')
    require 'pry'
    binding.pry
    assert_equal 200, page.status_code
    assert page.has_content?('Shared Bites')
  end
end
