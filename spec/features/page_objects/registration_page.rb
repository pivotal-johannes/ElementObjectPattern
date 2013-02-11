class RegistrationPage < PageObjectBase
  def register(field_values)
    visit new_user_registration_path

    fill_in "Email", with: field_values[:email]
    fill_in "user_email", with: field_values[:password]
    fill_in "Password confirmation", with: field_values[:password]

    click_on "Sign up"

    HomePage.new
  end
end
