require 'rails_helper'

RSpec.describe "options/index", type: :view do
  before(:each) do
    assign(:options, [
      Option.create!(
        :question_id => 2,
        :content => "Content",
        :description => "Description",
        :is_correct_answer => false
      ),
      Option.create!(
        :question_id => 2,
        :content => "Content",
        :description => "Description",
        :is_correct_answer => false
      )
    ])
  end

  it "renders a list of options" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
