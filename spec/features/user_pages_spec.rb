require 'spec_helper'

describe UsersController do
  
  subject { page }

  describe "index" do
#    before do
#      sign_in FactoryGirl.create(:user)
#      FactoryGirl.create(:user, name: "Ben", email: 'ben@example.com')
#      FactoryGirl.create(:user, name: 'Bob', email: 'bob@example.com')
#      visit users_path
#    end
    
#    it { shoudl have_selector('title', text: '全部使用者') }
#    it { should have_selector('h1', text: '全部使用者') }

#    describe "pagination" do

#      it { should have_selector('div.pagination') }
#      it "should list each user" do
#        User.paginate(page: 1).each do |user|
#          page.should have_selector('li', text: user.name)
#        end
#      end
#    end

    describe "delete links" do

      it { should_not have_link('刪除') }

      describe "as an admin user" do
        let(:admin) { FactoryGirl.create(:admin) }
        before do
          sign_in admin
          visit users_path
        end

        it { should have_link('刪除'，href: user_path(User.first)) }
        it "should be able to delete another user" do
          expect { click_link('刪除')}.to change(User, :count).by(-1)
        end
        it { should_not have_link('刪除'，href: user_path(admin)) }
      end
    end

    describe "should list all users" do
      User.all.each do |user|
        it { should have_selector('li', text: user.name) }
      end
    end
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('h1', text: user.name) }
#    it { should have_selector('title', text: user.name) }
  end

  describe "signup" do
  	before { visit signup_path }
  	let(:submit) { "建立帳號" }

  	describe "with invalid information" do
  	  it "should not create a user" do
  	  	expect { click_button submit }.not_to change(User, :count)
  	  end
  	end

#  	describe "with valid information" do
#  	  before do
#  	  	#fill_in "Name",  with: "Example User"
#  	  	fill_in "Email", with: "user@example.com"
#  	  	fill_in "Password", with: 'foobar'
#  	  	fill_in "Confirmation", with: 'foobar'
#  	  end#

#  	  it "should create a user" do
#  	    expect { click_button submit }.to change(User, :count).by(1)
#  	  end
#  	end
  end
end
