require 'rails_helper'

RSpec.describe "opinions/edit", type: :view do
  before(:each) do
    @opinion = assign(:opinion, Opinion.create!(
      AuthorId: 1,
      Text: "MyText"
    ))
  end

  it "renders the edit opinion form" do
    render

    assert_select "form[action=?][method=?]", opinion_path(@opinion), "post" do

      assert_select "input[name=?]", "opinion[AuthorId]"

      assert_select "textarea[name=?]", "opinion[Text]"
    end
  end
end
