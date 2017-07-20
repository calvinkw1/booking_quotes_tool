require 'rails_helper'

RSpec.describe "inquiries/edit", type: :view do
  before(:each) do
    @inquiry = assign(:inquiry, Inquiry.create!(
      :rental_site => "MyString",
      :unit_id => "",
      :price => "9.99",
      :tax => "9.99",
      :nights => 1,
      :adults => 1,
      :children => 1,
      :pets => 1
    ))
  end

  it "renders the edit inquiry form" do
    render

    assert_select "form[action=?][method=?]", inquiry_path(@inquiry), "post" do

      assert_select "input#inquiry_rental_site[name=?]", "inquiry[rental_site]"

      assert_select "input#inquiry_unit_id[name=?]", "inquiry[unit_id]"

      assert_select "input#inquiry_price[name=?]", "inquiry[price]"

      assert_select "input#inquiry_tax[name=?]", "inquiry[tax]"

      assert_select "input#inquiry_nights[name=?]", "inquiry[nights]"

      assert_select "input#inquiry_adults[name=?]", "inquiry[adults]"

      assert_select "input#inquiry_children[name=?]", "inquiry[children]"

      assert_select "input#inquiry_pets[name=?]", "inquiry[pets]"
    end
  end
end
