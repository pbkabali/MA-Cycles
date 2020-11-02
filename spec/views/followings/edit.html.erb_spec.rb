require 'rails_helper'

RSpec.describe "followings/edit", type: :view do
  before(:each) do
    @following = assign(:following, Following.create!(
      FollowerId: 1,
      FollowedId: 1
    ))
  end

  it "renders the edit following form" do
    render

    assert_select "form[action=?][method=?]", following_path(@following), "post" do

      assert_select "input[name=?]", "following[FollowerId]"

      assert_select "input[name=?]", "following[FollowedId]"
    end
  end
end
