require 'rails_helper'

RSpec.describe "options/show", type: :view do
  before(:each) do
    @option = assign(:option, Option.create!(
      :question_id => 2,
      :content => "Content",
      :description => "Description",
      :is_correct_answer => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Content/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/false/)
  end
end
