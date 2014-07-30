require_relative './feature_test_helper'

class AdminCanLogIn < FeatureTest
  def test_admin_can_log_in
    visit '/login'
    assert_equal 200, page.status_code
    assert page.has_content?('Username')
    assert page.has_field? "Username"
    assert page.has_field? "Password"
    fill_in('Username', with: 'admin')
    fill_in('Password', with: 'password')
    click_button('Login')

    assert_equal 200, page.status_code
    assert page.has_link?('Edit Brunch Menu')
    assert page.has_link?('Edit Regular Menu')
  end

  def test_admin_can_edit_menu_items
    visit '/login'
    assert_equal 200, page.status_code
    fill_in('Username', with: 'admin')
    fill_in('Password', with: 'password')
    click_button('Login')
    assert_equal 200, page.status_code
    assert page.has_link?('Edit Brunch Menu')
    click_link('Edit Brunch Menu')
    assert_equal 200, page.status_code
    assert page.has_content?('Fork It')
    assert page.has_content?('Admin options:')
    page.button.find('edit_menu_form_10').click
    # click specific edit button
    # find_by_id('edit_menu_form_10')
    # click specific delete button

  end
end
