require 'spec_helper'

describe "Topics" do
  context "when user logged in" do
    def sign_in_as_user user
      visit new_user_session_path
      fill_in "Email", :with => user.email
      fill_in "Password", :with => user.password
      click_link_or_button('Sign in')
    end

    before(:each) do
      sign_in_as_user FactoryGirl.create(:user)
    end

    describe "GET /topics" do
      it "loads" do
        # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
        visit topics_path
        page.should have_content("Listing topics")
      end
    end
  end
end
