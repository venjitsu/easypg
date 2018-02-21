require 'rails_helper'

RSpec.describe "services/index", type: :view do
  before(:each) do
    assign(:services, [
      Service.create!(
        :name => "Name",
        :identifier => 2
      ),
      Service.create!(
        :name => "Name",
        :identifier => 2
      )
    ])
  end

  it "renders a list of services" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
