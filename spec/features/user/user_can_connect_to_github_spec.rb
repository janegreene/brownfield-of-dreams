require 'rails_helper'

describe 'A registered user' do
  it 'can connect to github' do
    # user_2 = create(:user)
    # user_2.update(github_token: ENV["GITHUB_TOKEN_A"])
    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_2)
    # visit dashboard_path
  end
end
# As a user
# When I visit /dashboard
# Then I should see a link that is styled like a button that says "Connect to Github"
# And when I click on "Connect to Github"
# Then I should go through the OAuth process
# And I should be redirected to /dashboard
# And I should see all of the content from the previous Github stories (repos, followers, and following)
