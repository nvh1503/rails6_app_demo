require 'rails_helper'

RSpec.describe "questions/edit", type: :view do
  before(:each) do
    @question = assign(:question, Question.create!(
      :test_id => 1,
      :content => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit question form" do
    render

    assert_select "form[action=?][method=?]", question_path(@question), "post" do

      assert_select "input[name=?]", "question[test_id]"

      assert_select "input[name=?]", "question[content]"

      assert_select "input[name=?]", "question[description]"
    end
  end
end
