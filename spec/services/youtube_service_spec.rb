require 'rails_helper'

describe YoutubeService do
  it "returns playlist info" do
    playlist_id = "" #need to find longer list
    service = YoutubeService.new
    playlist_info = service.playlist_info(playlist_id)

    expect(playlist_info).to be_a Hash
  end
end
