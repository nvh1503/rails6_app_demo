require 'rails_helper'

RSpec.describe "questions/new", type: :view do
  before(:each) do
    assign(:question, Question.new(
      :test_id => 1,
      :content => "MyString",
      :description => "MyString"
    ))
  end

  it "renders new question form" do
    render

    assert_select "form[action=?][method=?]", questions_path, "post" do

      assert_select "input[name=?]", "question[test_id]"

      assert_select "input[name=?]", "question[content]"

      assert_select "input[name=?]", "question[description]"
    end
  end
end
