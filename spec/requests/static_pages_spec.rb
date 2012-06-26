require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Simply Meetings'" do
      visit '/static_pages/home'
      page.should have_content('Simply Meetings')
    end
  end
end
