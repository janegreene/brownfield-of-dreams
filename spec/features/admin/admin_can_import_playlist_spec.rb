require 'rails_helper'

describe "An Admin can import playlist" do
  let(:tutorial) { create(:tutorial) }
  let(:admin)    { create(:admin) }

  scenario "by importing from youtube", :js do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_tutorial_path(tutorial)
    # save_and_open_page
    click_on "Import YouTube Playlist"

    fill_in "playlist[id]", with: "#{playlist.id}"
    click_on "Create Tutorial" #not sure if this is true or Playlist
    expect(current_path).to eq(admin_dashboard_path(admin))

    expect(page).to have_content("Successfully created tutorial. View it here.")
    click_on "View it here."
    expect(current_path).to eq(tutorial_path(tutorial))

    within(first(".video")) do
      expect(page).to have_content("How to tie your shoes.") #not true...need to fix
    end
    #could use orderly gem to test more videos and the order they appear
  end
end
