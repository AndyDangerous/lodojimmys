require_relative './feature_test_helper'

class UserCanNavigateWebsite < FeatureTest
  def test_a_user_can_view_index
    visit '/'
    assert_equal 200, page.status_code
    assert page.has_content?('Innovative American Cuisine')
    assert page.has_link?('Home')
    assert page.has_link?('About Us')
    assert page.has_link?('Menu')
    assert page.has_link?('Location')
    assert page.has_link?('Contact')
  end

  def test_a_user_can_navigate_to_about_us
    visit '/'
    assert_equal 200, page.status_code
    click_link('About Us')
    assert_equal 200, page.status_code
    assert page.has_content?('Reviews')
  end

  def test_a_user_can_navigate_to_menu
    visit '/'
    assert_equal 200, page.status_code
    click_link('Menu')
    assert_equal 200, page.status_code
    assert page.has_content?('Regular Menu')
  end

  def test_a_user_can_navigate_to_location
    visit '/'
    assert_equal 200, page.status_code
    click_link('Location')
    assert_equal 200, page.status_code
    assert page.has_content?('Hours & Location')
  end

  def test_a_user_can_navigate_to_contact
    visit '/'
    assert_equal 200, page.status_code
    click_link('Contact')
    assert_equal 200, page.status_code
    assert page.has_content?('Contact Us')
  end
end
