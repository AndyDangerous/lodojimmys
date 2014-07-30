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
    assert page.has_content?('Admin Dahsboard')

  end

end
