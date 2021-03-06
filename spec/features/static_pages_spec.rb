require 'spec_helper'

describe "Static Pages" do
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  describe "Home page" do
    before { visit root_path }
    
    it "should have the h1 'Sample App" do
      page.should have_selector('h1', text: 'Sample App')
    end

#    it "should have base title" do
#      visit 'static_pages/home'
#      page.should have_selector('title' , text: base_title)
#    end

    #it "should have the title 'Home" do
    #  visit '/static_pages/home'
    #  page.should have_selector('title', text: "#{:base_title} | Home")
    #end
  end

  describe "Help page" do
    before { visit help_path }

  	it "should have the h1 'Help" do
  	  page.should have_selector('h1', text: "Help")
  	end

  	#it "should have the title 'Help" do
    #  visit '/static_pages/about'
    #  page.should have_selector('title', text: "#{base_title} | Help")
  	#end
  end

  describe "About page" do
    before { visit about_path }
    
    it "should have h1 'About Us" do
      page.should have_selector('h1', text: "About Us")
    end

    #it "should have the title 'About Us" do
#      visit '/static_pages/about'
#      page.should have_selector('title', text: "#{base_title} | About Us")
#    end
  end

  describe "Contact Page" do
    before { visit contact_path }

    it "should have h1 'Contact Us" do
      page.should have_selector('h1', text: "Contact Us")
    end

    #it "should have title 'Contact Us" do
#      visit 'static_pages/contact'
#      page.should have_selector('title', text: "#{base_title} | Contact Us")
#    end
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector('h1', text: 'About Us')
    click_link 'Contact'
    page.should have_selector('h1', text: 'Contact Us')
    click_link 'Help'
    page.should have_selector('h1', text: 'Help')
    click_link 'Home'
    page.should have_selector('h1', 'Welcome to the Sample App')
  end
end
