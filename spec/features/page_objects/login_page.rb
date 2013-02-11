class LoginPage < PageObjectBase

  def self.default_login(email="email@email.com", password="password")
    User.create!(email: email, password: password, password_confirmation: password)
    login_page = LoginPage.new
    login_page.login(email, password)
  end

  def login(username, password)
    visit new_user_session_path

    fill_in "Email", with: username
    fill_in "Password", with: password

    click_on "Sign in"

    HomePage.new
  end

  def flash
    find("#flash")
  end
end
