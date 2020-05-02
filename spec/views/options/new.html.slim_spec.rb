require 'rails_helper'

RSpec.describe "options/new", type: :view do
  before(:each) do
    assign(:option, Option.new(
      :question_id => 1,
      :content => "MyString",
      :description => "MyString",
      :is_correct_answer => false
    ))
  end

  it "renders new option form" do
    render

    assert_select "form[action=?][method=?]", options_path, "post" do

      assert_select "input[name=?]", "option[question_id]"

      assert_select "input[name=?]", "option[content]"

      assert_select "input[name=?]", "option[description]"

      assert_select "input[name=?]", "option[is_correct_answer]"
    end
  end
end
