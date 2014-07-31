require_relative './feature_test_helper'

class UserCanContactUs < FeatureTest
  def test_user_can_fill_in_form
    visit '/contact'
    assert_equal 200, page.status_code
    fill_in('contact[name]', with: 'Emily')
    fill_in('contact[email]', with: 'emilyadavis303@gmail.com')
    fill_in('contact[phone]', with: '1234567890')
    # fill_in('contact[subject]', with: 'General')
    fill_in('contact[message]', with: 'Wazzup')
    # click_button('Submit')
  end
end
