require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      Username: "MyString",
      FullName: "MyString",
      Photo: "MyString",
      CoverImage: "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input[name=?]", "user[Username]"

      assert_select "input[name=?]", "user[FullName]"

      assert_select "input[name=?]", "user[Photo]"

      assert_select "input[name=?]", "user[CoverImage]"
    end
  end
end
