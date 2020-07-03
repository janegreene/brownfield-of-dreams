require 'rails_helper'

describe "An Admin can import playlist" do
  before :each do
    @admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  end

  it "by importing from youtube more than 50 in order" do

    visit new_admin_tutorial_path
    # save_and_open_page

    fill_in 'Title', with: "New Import"
    fill_in 'Description', with: "New Import Description"
    fill_in 'Thumbnail', with: "" #need a thumbnail
    click_on "Import YouTube Playlist"
    expect(current_path).to eq(admin_dashboard_path)

    expect(page).to have_content("Successfully created tutorial. View it here.")
    click_on "View it here."
    expect(current_path).to eq(tutorial_path(Tutorial.last.id))
    tutorial = Tutorial.last
    expect(current_path).to eq(tutorial_path(tutorial.id))

    video = Video.last
    expect(video.tutorial_id).to eq(tutorial.id)
    expect(tutorial.videos.count).to be > 50 #need to find longer playlist
    expect(tutorial.videos.first.title).to eq('')#
    expect(tutorial.videos.first.last).to eq('')#
  end
end
