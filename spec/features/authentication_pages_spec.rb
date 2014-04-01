require 'spec_helper'

describe "Authentication" do
  
  subject { page }

  describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button '登入' }

      it { should have_content('請登入') }
    end
###  capybara does not work with simple_form ###
    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
#        fill_in "Email", with: user.email
#        fill_in "Password", with: user.password
        click_button '登入'
      end
#      it { should have_selector('title', text: user.name) }
#      it { should have_link('個人資料', href: user_path(user)) }
#      it { should have_link('登出', href: signout_path) }
#      it { should_not have_link('登入', href: signin_path) }

      describe "followed by signout" do
#        before { click_link '登出'}
#        it { should have_link '登入' }
      end
    end
  end
end
