require 'rails_helper'

RSpec.describe "options/edit", type: :view do
  before(:each) do
    @option = assign(:option, Option.create!(
      :question_id => 1,
      :content => "MyString",
      :description => "MyString",
      :is_correct_answer => false
    ))
  end

  it "renders the edit option form" do
    render

    assert_select "form[action=?][method=?]", option_path(@option), "post" do

      assert_select "input[name=?]", "option[question_id]"

      assert_select "input[name=?]", "option[content]"

      assert_select "input[name=?]", "option[description]"

      assert_select "input[name=?]", "option[is_correct_answer]"
    end
  end
end
