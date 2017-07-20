require 'rails_helper'

RSpec.describe "inquiries/index", type: :view do
  before(:each) do
    assign(:inquiries, [
      Inquiry.create!(
        :rental_site => "Rental Site",
        :unit_id => "",
        :price => "9.99",
        :tax => "9.99",
        :nights => 2,
        :adults => 3,
        :children => 4,
        :pets => 5
      ),
      Inquiry.create!(
        :rental_site => "Rental Site",
        :unit_id => "",
        :price => "9.99",
        :tax => "9.99",
        :nights => 2,
        :adults => 3,
        :children => 4,
        :pets => 5
      )
    ])
  end

  it "renders a list of inquiries" do
    render
    assert_select "tr>td", :text => "Rental Site".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
