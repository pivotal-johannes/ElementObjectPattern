class LoggedInPage < PageObjectBase
  def navigate(link)
    within("nav") do
      click_on link
      Object.const_get("#{link}Page").new
    end
  end
end
