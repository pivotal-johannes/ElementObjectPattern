require 'feature_helper'

describe "the signing up process", type: :feature do
  let(:email) { "user@pageobject.com" }
  let(:password) { "password" }

  before do
    User.destroy_all
    User.create!(email: email, password: password, password_confirmation: password)
  end

  it "allows a user to register" do
    registration_page = RegistrationPage.new

    home_page = registration_page.register(
        email: email,
        password: password,
    )

    flash = home_page.flash
    expect(flash).to be_success
    expect(flash).to have_content("Thanks for registering!")
  end

  it "allows a user to sign in" do
    login_page = LoginPage.new

    home_page = login_page.login(email, password)

    expect(home_page.email).to have_content(email)
  end

  it "allows a user to log out" do
    home_page = LoginPage.default_login

    login_page = home_page.logout

    expect(login_page).to have_content("Sign in")
  end
end
