include ApplicationHelper

def full_title(page_title)
  base_title = "Ruby on Rails Tutorial Sample App"
  if page_title.empty?
  	base_title
  else
  	"#{base_title} | #{page_title}"
  end
end

def sign_in(user)
  visit signin_path
  fill_in '電子信箱', with: user.email
  fill_in '密碼', with: user.password
  click_button '登入'
  cookies[:remember_token] = user.remember_token
end