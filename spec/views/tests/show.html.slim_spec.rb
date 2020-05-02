require 'rails_helper'

RSpec.describe "tests/show", type: :view do
  before(:each) do
    @test = assign(:test, Test.create!(
      :name => "Name",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
  end
end
