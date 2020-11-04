# require 'rails_helper'

# RSpec.describe "users/new", type: :view do
#   before(:each) do
#     assign(:user, User.new(
#       Username: "MyString",
#       FullName: "MyString",
#       Photo: "MyString",
#       CoverImage: "MyString"
#     ))
#   end

#   it "renders new user form" do
#     render

#     assert_select "form[action=?][method=?]", users_path, "post" do

#       assert_select "input[name=?]", "user[Username]"

#       assert_select "input[name=?]", "user[FullName]"

#       assert_select "input[name=?]", "user[Photo]"

#       assert_select "input[name=?]", "user[CoverImage]"
#     end
#   end
# end
