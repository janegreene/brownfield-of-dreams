require 'rails_helper'

describe "An Admin can import playlist" do
  before :each do
    @admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  end

  it "by importing from youtube" do

    visit new_admin_tutorial_path
    # save_and_open_page

    fill_in 'Title', with: "New Import"
    fill_in 'Description', with: "New Import Description"
    fill_in 'Thumbnail', with: ""
    click_on "Import YouTube Playlist"
    expect(current_path).to eq(admin_dashboard_path)

    expect(page).to have_content("Successfully created tutorial. View it here.")
    click_on "View it here."
    expect(current_path).to eq(tutorial_path(tutorial))

    within(first(".video")) do
      expect(page).to have_content("How to tie your shoes.") #not true...need to fix
    end
    #could use orderly gem to test more videos and the order they appear
  end
end
