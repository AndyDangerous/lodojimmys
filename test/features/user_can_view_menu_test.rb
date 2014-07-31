require_relative './feature_test_helper'

class UserCanViewMenu < FeatureTest
  def test_a_user_can_view_regular_menu
    visit '/menu_3'
    assert_equal 200, page.status_code
    assert page.has_content?('Shared Bites')
    assert page.has_content?('Fried Bison Ravioli')
    assert page.has_content?('Smoke House')
    assert page.has_content?('Mahi Mahi Po Boy')
  end

  def test_a_user_can_navigate_from_regular_to_brunch_menu
    visit '/menu_3'
    assert_equal 200, page.status_code
    assert page.has_link?('here')
    click_link('here')
    assert_equal 200, page.status_code
    assert page.has_content?('Served Saturday')
  end

  def test_a_user_can_view_brunch_menu
    visit '/menu_4'
    assert_equal 200, page.status_code
    assert page.has_content?('Drink It')
    assert page.has_content?('ManMosa')
    assert page.has_content?('Salmon Migas')
  end

  def test_a_user_can_navigate_from_brunch_to_regular_menu
    visit '/menu_4'
    assert_equal 200, page.status_code
    assert page.has_link?('here')
    click_link('here')
    assert_equal 200, page.status_code
    assert page.has_content?('Hot Wings')
  end
end
