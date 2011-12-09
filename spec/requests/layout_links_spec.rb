require 'spec_helper'

describe "LayoutLinks" do
  
  before(:each) do
    @base_title = "Ruby on Rails Tutorial Sample App"
  end
  
  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    response.should have_selector("title",
                                    :content => @base_title + " | About")
    click_link "Help"
    response.should have_selector("title",
                                    :content => @base_title + " | Help")
    click_link "Contact"
    response.should have_selector("title",
                                    :content => @base_title + " | Contact")
    click_link "Home"
    response.should have_selector("title",
                                    :content => @base_title + " | Home")
    click_link "Sign up"
    response.should have_selector("title",
                                    :content => @base_title + " | Sign up")
  end
  
  describe "when not signed in" do
    it "should have a signin link" do
      visit root_path
      response.should have_selector("a", :href => signin_path,
                                         :content => "Sign in")
    end
  end

  describe "when signed in" do

    before(:each) do
      @user = Factory(:user)
      visit signin_path
      fill_in :email,    :with => @user.email
      fill_in :password, :with => @user.password
      click_button
    end

    it "should have a signout link" do
      visit root_path
      response.should have_selector("a", :href => signout_path,
                                         :content => "Sign out")
    end

    it "should have a profile link" do
      visit root_path
      response.should have_selector("a", :href => user_path(@user),
                                         :content => "Profile")
    end
  end
end
