class HomePage < LoggedInPage
  def email
    find("#email")
  end

  def logout
    click_on "Logout"
    LoginPage.new
  end
end
