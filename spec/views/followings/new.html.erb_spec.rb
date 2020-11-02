require 'rails_helper'

RSpec.describe "followings/new", type: :view do
  before(:each) do
    assign(:following, Following.new(
      FollowerId: 1,
      FollowedId: 1
    ))
  end

  it "renders new following form" do
    render

    assert_select "form[action=?][method=?]", followings_path, "post" do

      assert_select "input[name=?]", "following[FollowerId]"

      assert_select "input[name=?]", "following[FollowedId]"
    end
  end
end
